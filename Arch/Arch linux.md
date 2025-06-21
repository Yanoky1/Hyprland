

# Полезное видео с установкой
https://www.youtube.com/watch?v=SBM2BUW-OH8&t=2s

# Очистка Arch
https://www.youtube.com/watch?v=zUbXOXqrZBs
Команды из видео
- Удаление кэша: pacman -Scc
- Удаление "орфанов": pacman -Qtdq | pacman -Rns -
- Удаление циркулярных зависимостей: pacman -Qqd | pacman -Rsu -
- Информация о пакете: pacman -Qii
- Вручную установленные пакеты: pacman -Qe
- Сторонние пакеты: pacman -Qm
- Та самая страшная команда: LC_ALL=C pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h
- То же самое, но короче: pacgrahp -c
- Удаление вместе с зависимостями: pacman -Rns

# Полезные ресурсы:
https://wiki.archlinux.org/title/syst...
https://wiki.archlinux.org/title/Pacm...



# Для установки с ру языком нужно поменять шрифт

```
setfont cyr-sun16
```

# Подключение к wifi

```
iwctl
```

```
station wlan0 scan
```

```
station wlan0 get-networks
```

```
station wlan0 connectl "wifi name"
```

```
passphrase: "password wifi"
```

# Подключение к wifi после установки hyprland

```
nmcli
```

```
nmcli device wifi list
```

```
nmcli device wifi connect "Сеть" password "Пароль"
```


# Нужные доп пакеты

`
sudo pacman -S git curl hyprpaper hyprlock waybar telegram-desktop bitwarden qbittorrent mpv obsidian firefox nemo 7zip zip ttf-font-awesome otf-font-awesome ttf-jetbrains-mono ttf-liberation code brightnessctl adw-gtk-theme fish pkgfile ttf-dejavu powerline nwg-look papirus-icon-theme fastfetch
`


# Русификация nemo

```
cinnamon-translations
```


# Sddm тема, способ установки

```
https://github.com/Machillka/Arona-sddm-login
```

Установить пакеты

```
sudo pacman -S sddm qt5-quickcontrols2 qt5-graphicaleffects qt5-svg
```

# Kitty темы

```
kitty +kitten themes
```

# Fish цвет autosuggestion

```
set -U fish_color_autosuggestion yellow
```

# Должно помочь с спящим режимом (не пробовал)
```
swayidle -w before-sleep 'swaylock -f'
```
