#!/bin/sh

# caps lock = control
xmodmap -e "remove lock = Caps_Lock"
xmodmap -e "add control = Caps_Lock"

# Disable bells
xset b off
xset b 0 0 0

