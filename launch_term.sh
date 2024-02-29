#!/bin/bash

pid=$(pgrep terminal | tail -n 1)
echo $pid

if [[ -z $pid ]]; then # if terminal is not running open it
	/bin/gnome-terminal
else # else give it focus and open a new tab
	wmctrl -a local 
	[[ $? == 1 ]] && /bin/gnome-terminal --tab	
fi
