#!/bin/bash

# options
setxkbmap fr
redshift -P -O 3500
nitrogen --restore

# programs
dunst &
nm-applet &
blueman-applet &
pipewire &

# scripts
#./scripts/batwarn.sh &
