#!/bin/bash


# check if window is currently "ABOVE"
xprop -id $(xdotool getactivewindow) | grep NET_WM_STATE | grep -q ABOVE

if [ $? -eq 0 ]; then 
	wmctrl -r :ACTIVE: -b remove,above
	#/home/kessler/my_scripts/toast.sh safety-pin.png
else
	wmctrl -r :ACTIVE: -b add,above
	/home/kessler/my_scripts/toast.sh pin.png
fi
