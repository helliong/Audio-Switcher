<p align="center">
  <a href="./README.md">
    <img src="https://img.shields.io/badge/English-0078D4?style=for-the-badge" alt="English">
  </a>
  <a href="./README.ru.md">
    <img src="https://img.shields.io/badge/Русский-D52B1E?style=for-the-badge" alt="Русский">
  </a>
</p>

# Audio Switcher — быстрое переключение аудиоустройств

[![Последний релиз](https://img.shields.io/github/v/release/helliong/audio-switcher?style=flat-square&label=релиз)](https://github.com/helliong/audio-switcher/releases/latest)
[![Windows](https://img.shields.io/badge/Windows-10%20%7C%2011-0078D4?style=flat-square&logo=windows)](https://github.com/helliong/audio-switcher)
[![AutoHotkey](https://img.shields.io/badge/AutoHotkey-v2-334455?style=flat-square&logo=autohotkey)](https://www.autohotkey.com/)
[![Загрузки SourceForge](https://img.shields.io/sourceforge/dm/audio-switcher?style=flat-square&label=загрузки)](https://sourceforge.net/projects/audio-switcher/files/)
[![Автор](https://img.shields.io/badge/Автор-helliong-181717?style=flat-square&logo=github)](https://helliong.space)

> Переключайтесь между колонками, наушниками, USB- и Bluetooth-устройствами с помощью настраиваемого сочетания клавиш.

[![Скачать Audio Switcher](https://a.fsdn.com/con/app/sf-download-button)](https://sourceforge.net/projects/audio-switcher/files/latest/download)

Audio Switcher — лёгкая утилита для Windows 10 и Windows 11, которая позволяет мгновенно переключаться между двумя устройствами вывода звука.

Программа автоматически определяет доступные устройства воспроизведения, показывает активное устройство, поддерживает настраиваемые глобальные сочетания клавиш и работает через системный трей Windows.

## Возможности

- Мгновенное переключение между двумя аудиоустройствами
- Автоматическое определение устройств воспроизведения
- Настраиваемое глобальное сочетание клавиш
- Поддержка Ctrl, Alt, Shift, буквенных и функциональных клавиш
- Отображение активного аудиоустройства
- Поддержка колонок, наушников, USB, Realtek и Bluetooth
- Русский и английский интерфейс
- Управление через системный трей
- Автоматический запуск вместе с Windows
- Системные уведомления
- Установочная и переносимая версии
- Поддержка Windows 10 и Windows 11
- Отдельная установка AutoHotkey для готовых сборок не требуется
- Права администратора не требуются

## Скачать

Последнюю версию можно скачать здесь:

- [SourceForge](https://sourceforge.net/projects/audio-switcher/)
- [GitHub Releases](https://github.com/helliong/audio-switcher/releases/latest)

Для большинства пользователей рекомендуется установщик с SourceForge:

[Скачать последнюю версию](https://sourceforge.net/projects/audio-switcher/files/latest/download)

Доступные файлы:

- `AudioSwitcherSetup-v1.0.0-win-x64.exe` — установщик Windows
- `AudioSwitcher-v1.0.0-portable-win-x64.zip` — переносимая версия
- `SHA256SUMS.txt` — контрольные суммы файлов

## Установка

### Установщик

1. Скачайте `AudioSwitcherSetup-v1.0.0-win-x64.exe`.
2. Запустите установщик.
3. Выберите язык установки.
4. При необходимости включите автозапуск с Windows или создайте ярлык на рабочем столе.
5. Запустите Audio Switcher.
6. Откройте **Настройки** через системный трей.
7. Выберите два устройства воспроизведения и настройте сочетание клавиш.

Microsoft Defender SmartScreen может показать предупреждение, поскольку приложение пока не имеет цифровой подписи.

Запускайте Audio Switcher только в том случае, если файл был скачан из официального репозитория GitHub или со страницы проекта на SourceForge.

### Переносимая версия

1. Скачайте `AudioSwitcher-v1.0.0-portable-win-x64.zip`.
2. Распакуйте все файлы в отдельную папку.
3. Запустите `AudioSwitcher.exe`.
4. Не удаляйте файлы SoundVolumeView из папки с Audio Switcher.

Переносимую версию можно запускать из любой папки или с USB-накопителя без установки.

## Использование

### Первая настройка

1. Нажмите правой кнопкой мыши по значку Audio Switcher в системном трее Windows.
2. Выберите **Настройки**.
3. Укажите первое устройство воспроизведения.
4. Укажите второе устройство воспроизведения.
5. Настройте глобальное сочетание клавиш.
6. Выберите язык интерфейса.
7. Нажмите **Сохранить**.

### Сочетание клавиш

Нажмите настроенное сочетание, чтобы переключиться между выбранными устройствами.

Сочетание по умолчанию:

```text
Ctrl + Alt + S
```

Сочетание можно изменить в любой момент. Поддерживаются комбинации с Ctrl, Alt, Shift, буквенными и функциональными клавишами.

### Системный трей

Нажмите правой кнопкой мыши по значку Audio Switcher, чтобы:

- Переключить текущее устройство вывода звука
- Открыть настройки
- Изменить устройства воспроизведения
- Изменить глобальное сочетание клавиш
- Изменить язык интерфейса
- Закрыть Audio Switcher

## Настройки

Audio Switcher сохраняет настройки отдельно для текущего пользователя Windows:

```text
%LOCALAPPDATA%\AudioSwitcher\settings.ini
```

В конфигурации хранятся:

- Первое устройство воспроизведения
- Второе устройство воспроизведения
- Глобальное сочетание клавиш
- Язык интерфейса

При обновлении приложения существующие настройки сохраняются.

## Системные требования

- Windows 10 или Windows 11
- 64-разрядная версия Windows
- Два доступных устройства воспроизведения
- Отдельная установка AutoHotkey для установочной и переносимой версий не требуется

## Текущая версия

### Audio Switcher v1.0.0

Первая стабильная версия включает:

- Автоматическое определение аудиоустройств
- Переключение между двумя выбранными устройствами
- Настраиваемые глобальные сочетания клавиш
- Отображение активного устройства
- Русскую и английскую локализацию
- Управление через системный трей
- Установщик Windows
- Переносимую версию
- Автоматический запуск вместе с Windows

## Контрольные суммы SHA-256

### Установщик

```text
fb9f11c8a012f5c73fa873a195936231e9eb16c00f8c51b91ac1a1db5121f05c
```

Файл:

```text
AudioSwitcherSetup-v1.0.0-win-x64.exe
```

### Переносимый архив

```text
a9662b78ea917148d8040c6b6ffbf99088292039fa1cae36cf3912a7de999b38
```

Файл:

```text
AudioSwitcher-v1.0.0-portable-win-x64.zip
```

## Проверка скачанного файла

Откройте PowerShell в папке со скачанным файлом:

```powershell
Get-FileHash ".\AudioSwitcherSetup-v1.0.0-win-x64.exe" -Algorithm SHA256
```

Для переносимого архива:

```powershell
Get-FileHash ".\AudioSwitcher-v1.0.0-portable-win-x64.zip" -Algorithm SHA256
```

Полученные значения должны совпадать с контрольными суммами выше или записями в `SHA256SUMS.txt`.

Также можно использовать `certutil`:

```powershell
certutil -hashfile "AudioSwitcherSetup-v1.0.0-win-x64.exe" SHA256
```

## Стороннее программное обеспечение

Audio Switcher использует [SoundVolumeView](https://www.nirsoft.net/utils/sound_volume_view.html) от NirSoft для определения и переключения аудиоустройств Windows.

SoundVolumeView распространяется на условиях собственной freeware-лицензии и остаётся собственностью своего автора.

## Исходный код

Полный исходный код доступен на GitHub:

[https://github.com/helliong/audio-switcher](https://github.com/helliong/audio-switcher)

## Сообщения об ошибках и предложения

Сообщить об ошибке или предложить новую функцию можно через GitHub Issues:

[https://github.com/helliong/audio-switcher/issues](https://github.com/helliong/audio-switcher/issues)

При создании сообщения об ошибке желательно указать:

- Версию Windows
- Версию Audio Switcher
- Названия и типы аудиоустройств
- Настроенное сочетание клавиш
- Последовательность действий для воспроизведения ошибки
- Полный текст ошибки
- Снимок экрана или запись экрана, когда это необходимо

## Запуск из исходного кода

### Требования

- Windows 10 или Windows 11
- Git
- AutoHotkey v2
- Файлы SoundVolumeView, включённые в репозиторий

Клонируйте репозиторий:

```powershell
git clone https://github.com/helliong/audio-switcher.git
cd audio-switcher
```

Запустите исходный скрипт:

```powershell
& ".\src\AudioSwitcher.ahk"
```

## Сборка

### Требования

- AutoHotkey v2
- Ahk2Exe
- Inno Setup 6 или 7

Скомпилируйте приложение:

```powershell
$compiler = ".\.tools\Ahk2Exe\Ahk2Exe.exe"
$base = "$env:ProgramFiles\AutoHotkey\v2\AutoHotkey64.exe"

New-Item -ItemType Directory -Force -Path ".\build"

& $compiler `
  /in ".\src\AudioSwitcher.ahk" `
  /out ".\build\AudioSwitcher.exe" `
  /base $base

Copy-Item ".\vendor\SoundVolumeView\*" ".\build" -Recurse -Force
```

Соберите установщик:

```powershell
& $iscc ".\installer\AudioSwitcher.iss"
```

Установщик будет создан в папке:

```text
dist\
```

## Ссылки проекта

- [Проект на SourceForge](https://sourceforge.net/projects/audio-switcher/)
- [Репозиторий GitHub](https://github.com/helliong/audio-switcher)
- [Последний релиз на GitHub](https://github.com/helliong/audio-switcher/releases/latest)
- [Сообщить об ошибке](https://github.com/helliong/audio-switcher/issues)
- [Сайт автора](https://helliong.space)

## Участие в разработке

Участие в развитии проекта приветствуется.

Вы можете помочь проекту следующими способами:

- Сообщить об ошибке
- Предложить новую функцию
- Улучшить документацию
- Отправить Pull Request

Перед отправкой Pull Request убедитесь, что исходный скрипт запускается без ошибок, а релизная сборка корректно переключает устройства.

## Автор

Разработчик: [helliong](https://github.com/helliong).

---

<p align="center">
  <a href="./README.md">English</a>
  ·
  <a href="./README.ru.md">Русский</a>
</p>
