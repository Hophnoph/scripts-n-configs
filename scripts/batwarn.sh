#!/bin/bash

# a script made to send a notifcation when laptop battery is too low
# best used with a minmal Windows Manager, like: i3, sway, qtile, dwm, etc
# will use dunst as the notifcation daemon by default, can be changed

# notifcation command, used to specify which daemon to use + the notifcation message
NOTIF_CMD=""
LOW_PERC=""
LOWEST_PERC=""


# i will dev this for later, steps are todo it is
# 1. make a var that stores battery level with some command using this syntax bat_level=$(command)
# 2. make an if statment to check if the battery level is lower than wanted using LOW_PERC var 
# 3. if it is, execute the NOTIF_CMD command to send warning with desird message + make another check for lower,
#    example it first checks if it's lower than 5%, then send message, then checks again if it's exactly 3%, which is about to shutdown, then makes a serious urgent warning final time 
