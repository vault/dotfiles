#!/bin/sh

# caps lock = control
xmodmap -e "remove lock = Caps_Lock"
xmodmap -e "add control = Caps_Lock"
xmodmap -e "pointer = 1 2 3 4 5 6 7 0 0 8"

# Disable bells
xset b off
xset b 0 0 0

