#!/bin/bash
Lock="Заблокировать"
Logout="Выйти"
Reboot="Перезагрузка"
Shutdown="Выключить"

chosen=$(printf " %s\n⏾ %s\n⏼ %s\n⏻ %s" "$Lock" "$Logout" "$Reboot" "$Shutdown" | wofi --dmenu)

case "$chosen" in
  " $Lock") hyprlock ;;
  "⏾ $Logout") hyprctl dispatch exit ;;
  "⏼ $Reboot") systemctl reboot ;;
  "⏻ $Shutdown") systemctl poweroff ;;
esac
