#!/usr/bin/env bash

run_rofi() {
  rofi -dmenu \
    -mesg "CHARGE: $(cat /sys/class/power_supply/BAT1/capacity)%" \
    -theme 'websearch.rasi'
    # -p Powermenu \
    # -theme-str 'listview {lines: 5; scrollbar: false;}' \
    # -theme-str 'window { width: 200px; }'
}

QUERY="$(run_rofi)"
if [ -n "$QUERY" ]; then
  xdg-open "https://duckduckgo.com/?t=ffab&q=${QUERY}&ia=web"
fi
