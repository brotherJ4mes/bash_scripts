#!/bin/bash

# is nautilus the active window?
naut_act=$(xprop -id $(xdotool getactivewindow) | grep WM_CLASS.*nautilus)
[[ -z $naut_act ]] && exit

sleep .2 # may need adjustment 
/usr/bin/xdotool key --clearmodifiers  shift+F10 e



