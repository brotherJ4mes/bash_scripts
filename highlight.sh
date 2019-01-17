#!/bin/bash

if [[ "$1" == "rm" ]]; then
	sleep .2; xdotool click 3 key --delay 60 Up Up Return
else
	sleep .2; xdotool key --delay 200 shift+Tab Return
fi
