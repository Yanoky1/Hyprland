#!/bin/bash

# Проверка на выполнение от root
if [ "$(id -u)" -ne 0 ]; then
    echo "Скрипт должен запускаться с правами root!" >&2
    exit 1
fi

# Обновление системы
echo -e "\n\033[1;32mОбновление системы...\033[0m"
pacman -Syu --noconfirm

# Установка основных пакетов
echo -e "\n\033[1;32mУстановка основных пакетов...\033[0m"
pacman -S --noconfirm \
    git curl neovim hyprpaper hyprlock hypridle waybar brightnessctl \
    p7zip zip telegram-desktop bitwarden qbittorrent mpv obsidian firefox \
    code nemo cinnamon-translations nemo-fileroller \
    ttf-dejavu ttf-font-awesome otf-font-awesome ttf-jetbrains-mono ttf-jetbrains-mono-nerd \
    fish nwg-look adw-gtk-theme papirus-icon-theme fastfetch xdg-user-dirs \
    vlc networkmanager pulsemixer

# Установка AUR helper (yay)
echo -e "\n\033[1;32mУстановка yay...\033[0m"
if ! command -v yay &> /dev/null; then
    sudo -u $SUDO_USER bash -c "\
        git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin && \
        cd /tmp/yay-bin && \
        makepkg -si --noconfirm"
else
    echo "yay уже установлен"
fi

# Установка AUR пакетов
echo -e "\n\033[1;32mУстановка AUR пакетов...\033[0m"
sudo -u $SUDO_USER yay -S --noconfirm \
    firefox-ublock-origin \
    bluetuith

# Настройка системы
echo -e "\n\033[1;32mФинальная настройка...\033[0m"
# Обновление БД шрифтов
fc-cache -fv
# Обновление иконок
gtk-update-icon-cache /usr/share/icons/Papirus
# Создание пользовательских директорий
sudo -u $SUDO_USER xdg-user-dirs-update

echo -e "\n\033[1;32mУстановка завершена!\033[0m"