<p align="center">
  <a href="./README.md">
    <img src="https://img.shields.io/badge/English-0078D4?style=for-the-badge" alt="English">
  </a>
  <a href="./README.ru.md">
    <img src="https://img.shields.io/badge/Русский-D52B1E?style=for-the-badge" alt="Русский">
  </a>
</p>

# Audio Switcher — Fast Audio Output Switching

[![Latest Release](https://img.shields.io/github/v/release/helliong/audio-switcher?style=flat-square&label=release)](https://github.com/helliong/audio-switcher/releases/latest)
[![Windows](https://img.shields.io/badge/Windows-10%20%7C%2011-0078D4?style=flat-square&logo=windows)](https://github.com/helliong/audio-switcher)
[![AutoHotkey](https://img.shields.io/badge/AutoHotkey-v2-334455?style=flat-square&logo=autohotkey)](https://www.autohotkey.com/)
[![SourceForge Downloads](https://img.shields.io/sourceforge/dm/audio-switcher?style=flat-square&label=downloads)](https://sourceforge.net/projects/audio-switcher/files/)
[![Author](https://img.shields.io/badge/Author-helliong-181717?style=flat-square&logo=github)](https://helliong.space)

> Switch between speakers, headphones, USB, or Bluetooth audio devices with a customizable hotkey.

[![Download Audio Switcher](https://a.fsdn.com/con/app/sf-download-button)](https://sourceforge.net/projects/audio-switcher/files/latest/download)

Audio Switcher is a lightweight utility for Windows 10 and Windows 11 that lets you instantly switch between two audio output devices.

It automatically detects available playback devices, shows the currently active device, supports configurable global hotkeys, and runs conveniently from the Windows system tray.

## Features

- Instant switching between two audio output devices
- Automatic playback-device detection
- Configurable global keyboard shortcut
- Support for Ctrl, Alt, Shift, letter, and function keys
- Currently active device indicator
- Support for speakers, headphones, USB, Realtek, and Bluetooth devices
- Russian and English interface
- System tray controls
- Optional startup with Windows
- Desktop notifications
- Automatic notifications about new GitHub releases
- Installer and portable distributions
- Support for Windows 10 and Windows 11
- No separate AutoHotkey installation required for release builds
- No administrator privileges required

## Download

Download the latest version from:

- [SourceForge](https://sourceforge.net/projects/audio-switcher/)
- [GitHub Releases](https://github.com/helliong/audio-switcher/releases/latest)

For most users, the installer from SourceForge is recommended:

[Download the latest version](https://sourceforge.net/projects/audio-switcher/files/latest/download)

Available packages:

- `AudioSwitcherSetup-v1.1.0-win-x64.exe` — Windows installer
- `AudioSwitcher-v1.1.0-portable-win-x64.zip` — portable version
- `SHA256SUMS.txt` — file verification checksums

## Installation

### Installer

1. Download `AudioSwitcherSetup-v1.1.0-win-x64.exe`.
2. Run the installer.
3. Choose the installation language.
4. Optionally enable startup with Windows or create a desktop shortcut.
5. Launch Audio Switcher.
6. Open **Settings** from the system tray.
7. Select two playback devices and configure a hotkey.

Windows may display a Microsoft Defender SmartScreen warning because the application is not digitally signed.

Only run Audio Switcher when it was downloaded from the official GitHub repository or SourceForge project page.

### Portable Version

1. Download `AudioSwitcher-v1.1.0-portable-win-x64.zip`.
2. Extract all files into a folder.
3. Run `AudioSwitcher.exe`.
4. Keep the included SoundVolumeView files in the same folder as Audio Switcher.

The portable version can be launched from any folder or USB drive and does not require installation.

## How to Use

### First Setup

1. Right-click the Audio Switcher icon in the Windows system tray.
2. Select **Settings**.
3. Choose the first playback device.
4. Choose the second playback device.
5. Configure a global keyboard shortcut.
6. Select the interface language.
7. Click **Save**.

### Keyboard Shortcut

Press the configured shortcut to switch between the selected devices.

The default shortcut is:

```text
Ctrl + Alt + S
```

The shortcut can be changed at any time. Audio Switcher supports combinations with Ctrl, Alt, Shift, letter keys, and function keys.

### System Tray

Right-click the Audio Switcher icon to:

- Switch the current audio output device
- Open settings
- Change playback devices
- Change the global hotkey
- Change the interface language
- Exit Audio Switcher

## Settings

Audio Switcher stores settings for the current Windows user in:

```text
%LOCALAPPDATA%\AudioSwitcher\settings.ini
```

The configuration contains:

- First playback device
- Second playback device
- Global keyboard shortcut
- Interface language

Existing settings are preserved when the application is updated.

## System Requirements

- Windows 10 or Windows 11
- 64-bit Windows
- Two available playback devices
- No separate AutoHotkey installation required for installer or portable releases

## Current Release

### Audio Switcher v1.1.0

This release includes:

- Automatic audio-device detection
- Switching between two selected devices
- Configurable global hotkeys
- Currently active device indicator
- Russian and English localization
- System tray controls
- Windows installer
- Portable distribution
- Optional startup with Windows
- Custom application and installer icons
- Version and project links in settings
- Automatic GitHub release checks
- Update status and download button in settings

## SHA-256 Checksums

### Installer

```text
5cf2cc7eba6e0b2dbf67c5de133d81627c52cf0d0e5d6b6e756fd7923ed20968
```

File:

```text
AudioSwitcherSetup-v1.1.0-win-x64.exe
```

### Portable Archive

```text
acb1cbb1a365aadddfb717fccb205a98ee4d3bf44fc43a2df6720e08a84c9e50
```

File:

```text
AudioSwitcher-v1.1.0-portable-win-x64.zip
```

## Verify the Download

Open PowerShell in the folder containing the downloaded file:

```powershell
Get-FileHash ".\AudioSwitcherSetup-v1.1.0-win-x64.exe" -Algorithm SHA256
```

For the portable archive:

```powershell
Get-FileHash ".\AudioSwitcher-v1.1.0-portable-win-x64.zip" -Algorithm SHA256
```

The returned hashes should match the values above or the entries in `SHA256SUMS.txt`.

You can also use `certutil`:

```powershell
certutil -hashfile "AudioSwitcherSetup-v1.1.0-win-x64.exe" SHA256
```

## Third-Party Software

Audio Switcher uses [SoundVolumeView](https://www.nirsoft.net/utils/sound_volume_view.html) by NirSoft to detect and switch Windows audio devices.

SoundVolumeView is distributed according to its own freeware license and remains the property of its respective author.

## Source Code

The complete source code is available on GitHub:

[https://github.com/helliong/audio-switcher](https://github.com/helliong/audio-switcher)

## Bug Reports and Suggestions

Report bugs or suggest features through GitHub Issues:

[https://github.com/helliong/audio-switcher/issues](https://github.com/helliong/audio-switcher/issues)

When reporting a problem, please include:

- Your Windows version
- Your Audio Switcher version
- The names and types of the audio devices
- The configured hotkey
- Steps required to reproduce the issue
- The full error message, when available
- A screenshot or screen recording, when useful

## Run From Source

### Requirements

- Windows 10 or Windows 11
- Git
- AutoHotkey v2
- SoundVolumeView files included in the repository

Clone the repository:

```powershell
git clone https://github.com/helliong/audio-switcher.git
cd audio-switcher
```

Run the source script:

```powershell
& ".\src\AudioSwitcher.ahk"
```

## Build

### Requirements

- AutoHotkey v2
- Ahk2Exe
- Inno Setup 6 or 7

Compile the application:

```powershell
$compiler = ".\.tools\Ahk2Exe\Ahk2Exe.exe"
$base = "$env:ProgramFiles\AutoHotkey\v2\AutoHotkey64.exe"

New-Item -ItemType Directory -Force -Path ".\build"

& $compiler `
  /in ".\src\AudioSwitcher.ahk" `
  /out ".\build\AudioSwitcher.exe" `
  /base $base `
  /icon ".\assets\AudioSwitcher.ico"

Copy-Item ".\vendor\SoundVolumeView\*" ".\build" -Recurse -Force
```

Build the installer:

```powershell
& $iscc ".\installer\AudioSwitcher.iss"
```

The installer will be created in:

```text
dist\
```

## Project Links

- [SourceForge Project](https://sourceforge.net/projects/audio-switcher/)
- [GitHub Repository](https://github.com/helliong/audio-switcher)
- [Latest GitHub Release](https://github.com/helliong/audio-switcher/releases/latest)
- [Bug Reports](https://github.com/helliong/audio-switcher/issues)
- [Author Website](https://helliong.space)

## Contributing

Contributions are welcome.

You can contribute by:

- Reporting bugs
- Suggesting new features
- Improving documentation
- Submitting a pull request

Before submitting a pull request, make sure the source script starts without errors and the release build switches devices correctly.

## Author

Developed by [helliong](https://github.com/helliong).

---

<p align="center">
  <a href="./README.md">English</a>
  ·
  <a href="./README.ru.md">Русский</a>
</p>
