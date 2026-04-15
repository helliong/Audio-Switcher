#Requires AutoHotkey v2.0

svv := "YOUR PATH TO SoundVolumeView.exe"
stateFile := A_ScriptDir "\audio_state.txt"

speakersId := "YOUR_SPEAKERS_ID"
headphonesId := "YOUR_HEADPHONES_IDr"

if !FileExist(stateFile)
    FileAppend "speakers", stateFile

^!s::
{
    state := Trim(FileRead(stateFile))

    if (state = "speakers")
    {
        RunWait '"' svv '" /SetDefault "' headphonesId '" all', , "Hide"
        FileDelete stateFile
        FileAppend "headphones", stateFile
        TrayTip "Звук", "Переключено на наушники"
    }
    else
    {
        RunWait '"' svv '" /SetDefault "' speakersId '" all', , "Hide"
        FileDelete stateFile
        FileAppend "speakers", stateFile
        TrayTip "Звук", "Переключено на колонки"
    }
}