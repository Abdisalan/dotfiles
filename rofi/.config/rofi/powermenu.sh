#!/usr/bin/env zsh

option="shutdown\nreboot"

choice="$(echo -e "$option" | rofi -p "Power Options" -dmenu -selected-row 0)"
case $choice in
    "shutdown")
        systemctl shutdown;;
    "reboot")
        systemctl reboot;;
esac
