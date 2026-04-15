Язык:

- 🇬🇧 [English](README.md)
- 🇷🇺 Русский (текущий)

---

# Audio Switcher (AutoHotkey v2)

Скрипт для Windows 10/11, который позволяет переключать звук между наушниками и колонками по горячей клавише.

---

## Возможности

- Быстрое переключение аудиоустройств
- Горячая клавиша: **Ctrl + Alt + S**
- Поддержка всех типов устройств (Realtek, USB, Bluetooth)
- Работает через SoundVolumeView

---

## Требования

Перед использованием установите:

- AutoHotkey v2 — https://www.autohotkey.com/
- SoundVolumeView — https://www.nirsoft.net/utils/sound_volume_view.html

---

## Установка

1. Скачайте и распакуйте SoundVolumeView
2. Поместите `SoundVolumeView.exe` в удобное место, например:
   `C:\Tools\SoundVolumeView\`
3. Создайте файл:
   `audio-switch.ahk`
4. Вставьте в него ваш скрипт
5. Укажите правильный путь:

   `svv := "C:\Tools\SoundVolumeView\SoundVolumeView.exe"`

---

## Настройка устройств

1. Запустите `SoundVolumeView.exe`
2. Найдите колонку: **Command-Line Friendly ID**
3. Скопируйте ID для:
   - колонок
   - наушников

Пример:

`Realtek High Definition Audio\Device\Speakers\Render`  
`Realtek High Definition Audio\Device\Headphones\Render`

4. Вставьте в скрипт:

`speakersId := "ВАШ_ID_КОЛОНОК"`  
`headphonesId := "ВАШ_ID_НАУШНИКОВ"`

---

## Использование

1. Запустите скрипт:
   `audio-switch.ahk`
2. Нажмите:
   **Ctrl + Alt + S**

Звук переключится между устройствами.

---

## Автозапуск (опционально)

Чтобы скрипт запускался вместе с Windows:

1. Нажмите `Win + R`
2. Введите:
   `shell:startup`
3. Поместите туда `.ahk` файл или ярлык
