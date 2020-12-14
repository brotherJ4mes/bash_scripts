#!/bin/bash

# check if window is currently "ABOVE"
xprop -id $(xdotool getactivewindow) | grep NET_WM_STATE | grep -q ABOVE

if [ $? -eq 0 ]; then 
	wmctrl -r :ACTIVE: -b remove,above
else
	wmctrl -r :ACTIVE: -b add,above
fi
