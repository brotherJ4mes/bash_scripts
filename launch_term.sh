#!/bin/bash

pid=$(pgrep terminal | tail -n 1)
echo $pid


if [[ -z $pid ]]; then # if terminal is not running open it
	/bin/gnome-terminal
else # else give it focus and open a new tab
	wmctrl -i -R  `wmctrl -lp | grep $pid | grep -v hangups | cut -d' ' -f1`
	[[ $? > 0 ]] && /bin/gnome-terminal
	#xdotool key Super+t
fi
