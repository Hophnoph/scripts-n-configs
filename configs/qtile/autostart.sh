#!/bin/bash

# options
setxkbmap fr
redshift -P -O 3500

# programs
dunst &
nm-applet &
blueman-applet &
pipewire &

# scripts
#./scripts/batwarn.sh &
