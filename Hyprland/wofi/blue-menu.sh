#!/bin/bash

# Проверка текущего состояния
status=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

# Получение списка paired устройств
devices=$(bluetoothctl paired-devices | awk '{print $2 " " $3}')

menu=$(echo -e "Power: on\nPower: off\n$devices" | wofi --dmenu --prompt "Bluetooth")

case "$menu" in
  "Power: on")
    bluetoothctl power on
    ;;
  "Power: off")
    bluetoothctl power off
    ;;
  *)
    mac=$(echo "$menu" | awk '{print $1}')
    bluetoothctl connect "$mac"
    ;;
esac
