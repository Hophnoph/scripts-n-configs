#!/bin/bash

# a script made to send a notifcation when laptop battery is too low
# best used with a minmal Windows Manager, like: i3, sway, qtile, dwm, etc
# will use dunst as the notifcation daemon by default

set -e

# low percentage to check
LOW_PERC=5

# lowest percentage to check
LOWEST_PERC=3 

# battery identifier or name
BAT_ID="BAT1"

# time to check the battery again (counted by minutes)
CHECK_INTERVAL=1

low_bat_notif_send="false"
lowest_bat_notif_send="false"

while true; do
  BAT_LEVEL=$(cat /sys/class/power_supply/${BAT_ID}/capacity)

  if [[ "$BAT_LEVEL" -le "$LOWEST_PERC" ]]; then
    if [[ "$low_bat_notif_send" == "false" ]]; then
      # lowest battery notifcation command and message (edit if you wanna use a diffrent messag or notifcation daemon)
      notify-send -u critical -i battery-low 'Battery VERY Low' 'Your Device will Shutdown NOW!'
      low_bat_notif_send="true"
    fi
  elif [[ "$BAT_LEVEL" -le "$LOW_PERC" ]]; then
    if [[ "$lowest_bat_notif_send" == "false" ]]; then
      # low battery notifcation command and message (edit if you wanna use a diffrent messag or notifcation daemon)
      notify-send -u critical -i battery-low 'Battery Low' 'Plug in your charger immediately!'
      lowest_bat_notif_send="true"
    fi
  fi

  if [[ "$BAT_LEVEL" -ge "$LOWEST_PERC" ]]; then
    lowest_bat_notif_send="false"
    lowest_bat_notif_send="false"
  fi

  sleep ${CHECK_INTERVAL}m
done
