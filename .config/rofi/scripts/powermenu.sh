#!/usr/bin/env bash


_shutdown=" Shutdown"
_reboot=" Reboot"
_suspend=" Suspend"
_lock=" Lock"
_logout=" Logout"

options() {
  echo $_shutdown
  echo $_reboot
  echo $_suspend
  echo $_lock
  echo $_logout
}

run_rofi() {
  options | rofi -dmenu \
    -mesg Powermenu \
    -theme 'powermenu.rasi'
    # -p Powermenu \
    # -theme-str 'listview {lines: 5; scrollbar: false;}' \
    # -theme-str 'window { width: 200px; }'
}

chosen="$(run_rofi)"
case ${chosen} in
  $_shutdown)
    systemctl poweroff
    ;;
  $_reboot)
    systemctl reboot
    ;;
  $_suspend)
    systemctl suspend
    ;;
  $_lock)
    i3lock-fancy
    ;;
  $_logout)
    i3-msg exit
    ;;
esac
