#!/bin/bash

chosen=$(printf " Lock\n⏾ Logout\n⏼ Reboot\n⏻ Shutdown" | wofi --dmenu --width=200 --height=200 --prompt "Power")

case "$chosen" in
  " Lock") hyprlock ;;
  "⏾ Logout") hyprctl dispatch exit ;;
  "⏼ Reboot") systemctl reboot ;;
  "⏻ Shutdown") systemctl poweroff ;;
esac
