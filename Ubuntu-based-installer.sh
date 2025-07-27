#!/bin/bash

# Проверка, что скрипт выполняется от root
if [[ "$EUID" -ne 0 ]]; then
  echo "Пожалуйста, запустите скрипт с правами root: sudo $0"
  exit 1
fi

echo "=== Устранение писка ==="

# Изменение GRUB
GRUB_FILE="/etc/default/grub"
if grep -q '^GRUB_CMDLINE_LINUX_DEFAULT=' "$GRUB_FILE"; then
  sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash snd_sof.sof_debug=1"/' "$GRUB_FILE"
else
  echo 'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash snd_sof.sof_debug=1"' >> "$GRUB_FILE"
fi
update-grub

# Добавление параметра модуля
echo "options snd_sof sof_debug=1" >> /etc/modprobe.d/alsa-base.conf

echo "=== VLC Fix (i965) ==="
apt update
apt install -y i965-va-driver

# Добавление переменной в ~/.profile текущего пользователя
echo 'export LIBVA_DRIVER_NAME=i965' >> "/home/$SUDO_USER/.profile"

echo "=== Установка Fish Shell ==="
apt install -y fish
echo "/bin/fish" >> /etc/shells
chsh -s /bin/fish "$SUDO_USER"

echo "=== Установка Flatpak и Flathub ==="
apt install -y flatpak
sudo -u "$SUDO_USER" flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Готово. Перезагрузите систему, чтобы изменения GRUB вступили в силу."
