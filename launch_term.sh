#!/bin/bash

pid=$(pgrep terminal | tail -n 1)
echo $pid


if [[ -z $pid ]]; then # if terminal is not running open it
	/bin/gnome-terminal
else # else give it focus and open a new tab
	
	# option a: give focus to local term (if none, then open one)
	wmctrl -a local 
	[[ $? == 1 ]] && /bin/gnome-terminal --tab	
	

	# option b: 
	#########wmctrl -i -R  `wmctrl -lp | grep $pid | cut -d' ' -f1`

	# using hangups with terminal
	#wmctrl -i -R  `wmctrl -lp | grep $pid | grep -v hangups | cut -d' ' -f1`
	#[[ $? > 0 ]] && /bin/gnome-terminal
	#xdotool key Super+t
fi
