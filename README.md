Language:

- 🇬🇧 English (current)
- 🇷🇺 [Русский](README.ru.md)

---

# Audio Switcher (AutoHotkey v2)

Script for Windows 10/11 that allows you to switch audio output between headphones and speakers using a hotkey.

---

## Features

- Fast audio device switching
- Hotkey: **Ctrl + Alt + S**
- Works with all device types (Realtek, USB, Bluetooth)
- Uses SoundVolumeView (reliable method)

---

## Requirements

Install before using:

- AutoHotkey v2 — https://www.autohotkey.com/
- SoundVolumeView — https://www.nirsoft.net/utils/sound_volume_view.html

---

## Installation

1. Download and extract SoundVolumeView
2. Place `SoundVolumeView.exe` somewhere, for example:
   `C:\Tools\SoundVolumeView\`
3. Create file:
   `audio-switch.ahk` (for troubleshoots look step below)
4. Paste your script into it
5. Set correct path:

   `svv := "C:\Tools\SoundVolumeView\SoundVolumeView.exe"`

---

## File Extension (IMPORTANT)

If you don't see file extensions in Windows:

1. Open **File Explorer (This PC)**
2. Click **three dots at the top (…)**
3. Select **Options**
4. Go to **View**
5. Uncheck:
   `Hide extensions for known file types`
6. Click **OK**

### Rename file correctly

Correct:
`audio-switch.ahk`

Wrong:
`audio-switch.ahk.txt`

Rename:
`audio-switch.txt → audio-switch.ahk`

---

## Device Setup

1. Run `SoundVolumeView.exe`
2. Find column: **Command-Line Friendly ID**
3. Copy IDs for:
   - speakers
   - headphones

Example:

`Realtek High Definition Audio\Device\Speakers\Render`  
`Realtek High Definition Audio\Device\Headphones\Render`

4. Paste into script:

`speakersId := "YOUR_SPEAKERS_ID"`  
`headphonesId := "YOUR_HEADPHONES_ID"`

---

## Usage

1. Run:
   `audio-switch.ahk`
2. Press:
   **Ctrl + Alt + S**

Audio will switch between devices.

---

## Autostart (optional)

To run script on Windows startup:

1. Press `Win + R`
2. Type:
   `shell:startup`
3. Put `.ahk` file or shortcut there
