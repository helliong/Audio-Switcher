#define AppName "Audio Switcher"
#define AppVersion "1.1.0"
#define AppPublisher "helliong"
#define AppExeName "AudioSwitcher.exe"

[Setup]
AppId={{4B60EA5D-1F86-41E6-B5E4-EFB0B36DB955}
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL=https://github.com/helliong/audio-switcher
AppSupportURL=https://github.com/helliong/audio-switcher/issues
AppUpdatesURL=https://github.com/helliong/audio-switcher/releases

DefaultDirName={localappdata}\Programs\AudioSwitcher
DefaultGroupName={#AppName}
DisableProgramGroupPage=yes

PrivilegesRequired=lowest
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

OutputDir=..\dist
OutputBaseFilename=AudioSwitcherSetup-v{#AppVersion}-win-x64

Compression=lzma2
SolidCompression=yes
WizardStyle=modern
SetupIconFile=..\assets\AudioSwitcher.ico

UninstallDisplayName={#AppName}
UninstallDisplayIcon={app}\{#AppExeName}

CloseApplications=yes
RestartApplications=no

ShowLanguageDialog=auto

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[CustomMessages]
english.StartupTask=Start Audio Switcher with Windows
russian.StartupTask=Запускать Audio Switcher вместе с Windows

english.DesktopTask=Create a desktop shortcut
russian.DesktopTask=Создать ярлык на рабочем столе

[Tasks]
Name: "startup"; Description: "{cm:StartupTask}"; Flags: checkedonce
Name: "desktopicon"; Description: "{cm:DesktopTask}"; Flags: unchecked

[Dirs]
Name: "{localappdata}\AudioSwitcher"

[Files]
Source: "..\build\*"; DestDir: "{app}"; \
    Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#AppName}"; \
    Filename: "{app}\{#AppExeName}"

Name: "{autodesktop}\{#AppName}"; \
    Filename: "{app}\{#AppExeName}"; \
    Tasks: desktopicon

[Registry]
Root: HKCU; \
    Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; \
    ValueType: string; \
    ValueName: "AudioSwitcher"; \
    ValueData: """{app}\{#AppExeName}"""; \
    Tasks: startup; \
    Flags: uninsdeletevalue

[INI]
Filename: "{localappdata}\AudioSwitcher\settings.ini"; \
    Section: "General"; \
    Key: "Language"; \
    String: "ru"; \
    Languages: russian; \
    Flags: createkeyifdoesntexist

Filename: "{localappdata}\AudioSwitcher\settings.ini"; \
    Section: "General"; \
    Key: "Language"; \
    String: "en"; \
    Languages: english; \
    Flags: createkeyifdoesntexist

[Run]
Filename: "{app}\{#AppExeName}"; \
    Description: "{cm:LaunchProgram,{#StringChange(AppName, '&', '&&')}}"; \
    Flags: nowait postinstall skipifsilent
