#Requires AutoHotkey v2.0
#SingleInstance Force

global AppName := "Audio Switcher"
global ConfigDir := EnvGet("LOCALAPPDATA") "\AudioSwitcher"
global ConfigPath := ConfigDir "\settings.ini"
global SvvPath := FindSoundVolumeView()

global CurrentLanguage := IniRead(
    ConfigPath,
    "General",
    "Language",
    "ru"
)

global CurrentHotkey := ""
global ActiveDeviceLabel := 0

if !DirExist(ConfigDir)
    DirCreate ConfigDir

if (SvvPath = "")
{
    MsgBox(T("svv_missing"), AppName, "Iconx")
    ExitApp
}

BuildTrayMenu()
RegisterInitialHotkey()

A_IconTip := AppName

T(key)
{
    global CurrentLanguage

    static translations := Map(
        "ru", Map(
            "svv_missing", "Не найден SoundVolumeView.exe.`n`nПроверьте папку vendor\SoundVolumeView.",
            "tray_switch", "Переключить устройство",
            "tray_settings", "Настройки",
            "tray_exit", "Выход",
            "settings_title", "Настройки",
            "current_device", "Сейчас активно",
            "unknown_device", "не удалось определить",
            "first_device", "Первое устройство:",
            "second_device", "Второе устройство:",
            "current_marker", "используется сейчас",
            "hotkey", "Горячая клавиша:",
            "hotkey_help", "Поддерживаются Ctrl, Alt, Shift и буквенные клавиши.",
            "language", "Язык интерфейса:",
            "save", "Сохранить",
            "cancel", "Отмена",
            "not_configured", "Аудиоустройства пока не настроены.",
            "switched", "Аудиоустройство переключено",
            "switch_failed", "Не удалось переключить устройство.",
            "less_than_two", "Найдено меньше двух устройств воспроизведения.`n`nПроверьте, подключены ли колонки и наушники.",
            "devices_failed", "Не удалось получить список устройств.",
            "list_not_created", "SoundVolumeView не создал список устройств.",
            "choose_devices", "Выберите оба аудиоустройства.",
            "different_devices", "Необходимо выбрать два разных устройства.",
            "enter_hotkey", "Укажите горячую клавишу.",
            "modifier_required", "Используйте хотя бы один модификатор:`nCtrl, Alt или Shift.",
            "hotkey_failed", "Не удалось зарегистрировать горячую клавишу.",
            "settings_saved", "Настройки сохранены",
            "state_active", "Активно",
            "state_disabled", "Отключено",
            "state_unplugged", "Не подключено"
        ),

        "en", Map(
            "svv_missing", "SoundVolumeView.exe was not found.`n`nCheck the vendor\SoundVolumeView folder.",
            "tray_switch", "Switch device",
            "tray_settings", "Settings",
            "tray_exit", "Exit",
            "settings_title", "Settings",
            "current_device", "Currently active",
            "unknown_device", "unable to determine",
            "first_device", "First device:",
            "second_device", "Second device:",
            "current_marker", "currently in use",
            "hotkey", "Hotkey:",
            "hotkey_help", "Ctrl, Alt, Shift and letter keys are supported.",
            "language", "Interface language:",
            "save", "Save",
            "cancel", "Cancel",
            "not_configured", "Audio devices have not been configured yet.",
            "switched", "Audio device switched",
            "switch_failed", "Failed to switch the audio device.",
            "less_than_two", "Fewer than two playback devices were found.`n`nCheck that your speakers and headphones are connected.",
            "devices_failed", "Failed to retrieve the device list.",
            "list_not_created", "SoundVolumeView did not create the device list.",
            "choose_devices", "Select both audio devices.",
            "different_devices", "Select two different devices.",
            "enter_hotkey", "Specify a hotkey.",
            "modifier_required", "Use at least one modifier:`nCtrl, Alt or Shift.",
            "hotkey_failed", "Failed to register the hotkey.",
            "settings_saved", "Settings saved",
            "state_active", "Active",
            "state_disabled", "Disabled",
            "state_unplugged", "Unplugged"
        )
    )

    language := translations.Has(CurrentLanguage)
        ? CurrentLanguage
        : "ru"

    return translations[language].Has(key)
        ? translations[language][key]
        : key
}

BuildTrayMenu()
{
    A_TrayMenu.Delete()
    A_TrayMenu.Add(T("tray_switch"), SwitchAudioDevice)
    A_TrayMenu.Add()
    A_TrayMenu.Add(T("tray_settings"), OpenSettings)
    A_TrayMenu.Add(T("tray_exit"), ExitApplication)
    A_TrayMenu.Default := T("tray_switch")
}

FindSoundVolumeView()
{
    possiblePaths := [
        A_ScriptDir "\SoundVolumeView.exe",
        A_ScriptDir "\..\vendor\SoundVolumeView\SoundVolumeView.exe"
    ]

    for path in possiblePaths
    {
        if FileExist(path)
            return path
    }

    return ""
}

RegisterInitialHotkey()
{
    global ConfigPath

    savedHotkey := IniRead(
        ConfigPath,
        "General",
        "Hotkey",
        "^!s"
    )

    if !ApplyHotkey(savedHotkey, false)
        ApplyHotkey("^!s", true)
}

ApplyHotkey(newHotkey, showError := true)
{
    global AppName, CurrentHotkey

    if (newHotkey = "")
        return false

    oldHotkey := CurrentHotkey

    if (oldHotkey = newHotkey)
        return true

    if (oldHotkey != "")
    {
        try Hotkey oldHotkey, "Off"
    }

    try
    {
        ; "On" обязательно: выбранный хоткей мог использоваться
        ; раньше и остаться зарегистрированным в выключенном состоянии.
        Hotkey newHotkey, SwitchAudioDevice, "On"

        CurrentHotkey := newHotkey
        return true
    }
    catch as error
    {
        ; Если новый хоткей зарегистрировать не получилось,
        ; восстанавливаем предыдущий.
        if (oldHotkey != "")
        {
            try Hotkey oldHotkey, SwitchAudioDevice, "On"
        }

        CurrentHotkey := oldHotkey

        if showError
        {
            MsgBox(
                T("hotkey_failed") "`n`n" error.Message,
                AppName,
                "Iconx"
            )
        }

        return false
    }
}
SwitchAudioDevice(*)
{
    global AppName, SvvPath, ConfigPath

    device1 := IniRead(ConfigPath, "Devices", "Device1", "")
    device2 := IniRead(ConfigPath, "Devices", "Device2", "")

    if (device1 = "" || device2 = "")
    {
        MsgBox(T("not_configured"), AppName, "Icon!")
        return
    }

    command := Format(
        '"{1}" /SwitchDefault "{2}" "{3}" all',
        SvvPath,
        device1,
        device2
    )

    try
    {
        RunWait command, , "Hide"
        TrayTip(T("switched"), AppName)
        SetTimer RefreshActiveDeviceStatus, -500
    }
    catch as error
    {
        MsgBox(
            T("switch_failed") "`n`n" error.Message,
            AppName,
            "Iconx"
        )
    }
}

OpenSettings(*)
{
    global AppName, ConfigPath
    global CurrentLanguage, ActiveDeviceLabel

    devices := GetPlaybackDevices()

    if (devices.Length < 2)
    {
        MsgBox(T("less_than_two"), AppName, "Icon!")
        return
    }

    deviceNames := []

    for device in devices
    {
        displayName := device.DisplayName

        if device.IsDefault
            displayName .= " — " T("current_marker")

        deviceNames.Push(displayName)
    }

    savedDevice1 := IniRead(
        ConfigPath,
        "Devices",
        "Device1",
        ""
    )

    savedDevice2 := IniRead(
        ConfigPath,
        "Devices",
        "Device2",
        ""
    )

    savedHotkey := IniRead(
        ConfigPath,
        "General",
        "Hotkey",
        "^!s"
    )

    selectedDevice1 := FindDeviceIndex(
        devices,
        savedDevice1,
        1
    )

    selectedDevice2 := FindDeviceIndex(
        devices,
        savedDevice2,
        2
    )

    selectedLanguage := CurrentLanguage = "en" ? 2 : 1

    guiWindow := Gui(
        ,
        AppName " — " T("settings_title")
    )

    guiWindow.SetFont("s10", "Segoe UI")

    ActiveDeviceLabel := guiWindow.AddText(
        "xm ym w440 c16803A",
        "● " T("current_device") ": "
        GetActiveDeviceName(devices)
    )

    guiWindow.AddText("xm y+20", T("first_device"))

    firstDeviceList := guiWindow.AddDropDownList(
        "xm y+6 w440 Choose" selectedDevice1,
        deviceNames
    )

    guiWindow.AddText("xm y+18", T("second_device"))

    secondDeviceList := guiWindow.AddDropDownList(
        "xm y+6 w440 Choose" selectedDevice2,
        deviceNames
    )

    guiWindow.AddText("xm y+18", T("hotkey"))

    hotkeyInput := guiWindow.Add(
        "Hotkey",
        "xm y+6 w440",
        savedHotkey
    )

    guiWindow.AddText(
        "xm y+6 w440 c666666",
        T("hotkey_help")
    )

    guiWindow.AddText("xm y+18", T("language"))

    languageList := guiWindow.AddDropDownList(
        "xm y+6 w440 Choose" selectedLanguage,
        ["Русский", "English"]
    )

    saveButton := guiWindow.AddButton(
        "xm y+22 w210 h34 Default",
        T("save")
    )

    cancelButton := guiWindow.AddButton(
        "x+10 yp w210 h34",
        T("cancel")
    )

    saveButton.OnEvent(
        "Click",
        SaveSettings.Bind(
            guiWindow,
            firstDeviceList,
            secondDeviceList,
            hotkeyInput,
            languageList,
            devices
        )
    )

    cancelButton.OnEvent(
        "Click",
        CloseSettings.Bind(guiWindow)
    )

    guiWindow.OnEvent(
        "Close",
        CloseSettings.Bind(guiWindow)
    )

    guiWindow.Show("AutoSize Center")
}

GetPlaybackDevices(showError := true)
{
    global SvvPath

    devices := []

    outputPath := (
        A_Temp
        "\audio-switcher-devices-"
        A_TickCount
        ".txt"
    )

    command := Format(
        '"{1}" /SaveFileEncoding 2 /stab "{2}" ' .
        '/Columns "Name,Type,Direction,Device State,' .
        'Command-Line Friendly ID,Default"',
        SvvPath,
        outputPath
    )

    try
    {
        RunWait command, , "Hide"

        if !FileExist(outputPath)
            throw Error(T("list_not_created"))

        content := FileRead(outputPath)

        for line in StrSplit(content, "`n", "`r")
        {
            if (Trim(line) = "")
                continue

            fields := StrSplit(line, "`t")

            if (fields.Length < 6)
                continue

            name := Trim(fields[1])
            itemType := Trim(fields[2])
            direction := Trim(fields[3])
            deviceState := Trim(fields[4])
            deviceId := Trim(fields[5])
            defaultValue := StrLower(Trim(fields[6]))

            if (itemType != "Device")
                continue

            if (direction != "Render")
                continue

            if (
                deviceId = ""
                || deviceId = "Command-Line Friendly ID"
            )
            {
                continue
            }

            isDefault := (
                defaultValue != ""
                && defaultValue != "no"
                && defaultValue != "false"
                && defaultValue != "нет"
            )

            devices.Push({
                Name: name,
                DisplayName: (
                    name " — "
                    FormatDeviceState(deviceState)
                ),
                Id: deviceId,
                IsDefault: isDefault
            })
        }
    }
    catch as error
    {
        if showError
        {
            MsgBox(
                T("devices_failed") "`n`n" error.Message,
                "Audio Switcher",
                "Iconx"
            )
        }
    }
    finally
    {
        if FileExist(outputPath)
            FileDelete outputPath
    }

    return devices
}

FormatDeviceState(state)
{
    normalizedState := StrLower(Trim(state))

    if (normalizedState = "active")
        return T("state_active")

    if (normalizedState = "disabled")
        return T("state_disabled")

    if (
        normalizedState = "unplugged"
        || normalizedState = "not plugged in"
    )
    {
        return T("state_unplugged")
    }

    return state
}

GetActiveDeviceName(devices)
{
    for device in devices
    {
        if device.IsDefault
            return device.Name
    }

    return T("unknown_device")
}

RefreshActiveDeviceStatus(*)
{
    global ActiveDeviceLabel

    if !IsObject(ActiveDeviceLabel)
        return

    devices := GetPlaybackDevices(false)

    try
    {
        ActiveDeviceLabel.Text := (
            "● " T("current_device") ": "
            GetActiveDeviceName(devices)
        )
    }
}

FindDeviceIndex(devices, deviceId, fallbackIndex)
{
    if (deviceId != "")
    {
        for index, device in devices
        {
            if (device.Id = deviceId)
                return index
        }
    }

    return fallbackIndex <= devices.Length
        ? fallbackIndex
        : 1
}

SaveSettings(
    guiWindow,
    firstDeviceList,
    secondDeviceList,
    hotkeyInput,
    languageList,
    devices,
    *
)
{
    global AppName, ConfigPath, CurrentLanguage

    firstIndex := firstDeviceList.Value
    secondIndex := secondDeviceList.Value
    newHotkey := hotkeyInput.Value

    if (firstIndex = 0 || secondIndex = 0)
    {
        MsgBox(T("choose_devices"), AppName, "Icon!")
        return
    }

    if (firstIndex = secondIndex)
    {
        MsgBox(T("different_devices"), AppName, "Icon!")
        return
    }

    if (newHotkey = "")
    {
        MsgBox(T("enter_hotkey"), AppName, "Icon!")
        return
    }

    hasModifier := (
        InStr(newHotkey, "^")
        || InStr(newHotkey, "!")
        || InStr(newHotkey, "+")
    )

    if !hasModifier
    {
        MsgBox(T("modifier_required"), AppName, "Icon!")
        return
    }

    if !ApplyHotkey(newHotkey)
        return

    firstDevice := devices[firstIndex]
    secondDevice := devices[secondIndex]
    newLanguage := languageList.Value = 2 ? "en" : "ru"

    IniWrite(
        firstDevice.Id,
        ConfigPath,
        "Devices",
        "Device1"
    )

    IniWrite(
        secondDevice.Id,
        ConfigPath,
        "Devices",
        "Device2"
    )

    IniWrite(
        newHotkey,
        ConfigPath,
        "General",
        "Hotkey"
    )

    IniWrite(
        newLanguage,
        ConfigPath,
        "General",
        "Language"
    )

    CurrentLanguage := newLanguage
    BuildTrayMenu()
    CloseSettings(guiWindow)

    TrayTip(
        firstDevice.Name " ↔ " secondDevice.Name,
        T("settings_saved")
    )
}

CloseSettings(guiWindow, *)
{
    global ActiveDeviceLabel

    try guiWindow.Destroy()
    ActiveDeviceLabel := 0
}

ExitApplication(*)
{
    ExitApp
}