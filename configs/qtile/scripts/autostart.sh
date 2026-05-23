#!/bin/bash

# options
nitrogen --restore
redshift -P -O 3500
setxkbmap fr

# programs
dunst &
nm-applet &
blueman-applet &
pipewire &
