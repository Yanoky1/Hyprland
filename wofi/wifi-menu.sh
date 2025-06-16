#!/bin/bash

# Сканируем сети
nmcli device wifi rescan > /dev/null

# Получаем список SSID + силу сигнала
wifi_list=$(nmcli -f SSID,SIGNAL,SECURITY device wifi list | awk 'NR>1 && $1!="" {print $0}' | uniq)

# Выводим в wofi и получаем выбранную сеть
choice=$(echo "$wifi_list" | wofi --dmenu --prompt "Выберите Wi-Fi сеть:" --width 400 --height 500)

# Получаем только SSID (первое слово в строке)
ssid=$(echo "$choice" | awk '{print $1}')

# Если сеть выбрана — пробуем подключиться (NetworkManager сам спросит пароль, если нужно)
[ -n "$ssid" ] && nmcli device wifi connect "$ssid"
