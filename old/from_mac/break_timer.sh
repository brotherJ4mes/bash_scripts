#!/bin/bash

# begin timer script
short_break=20   #minutes
#short_break=.5   #minutes
snooze=1        #minutes

response=$(osascript -e 'display dialog "break timer is activated!"')
if [ -z "$response" ]; then
	osascript -e 'display dialog "break timer has been cancelled for this session" buttons {"got it!"}'
	exit 1
fi

sleep $(echo ${short_break}*60 | bc)

while true; do
	if pgrep -q ScreenSaverEngine; then  # check if screen saver is running
		while true; do
			if ! pgrep -q ScreenSaverEngine; then #if SS is done, break out of loop
				osascript -e 'display dialog "break timer RESUMED!"'
				sleep $(echo ${short_break}*60 | bc)
				break                         
			fi
			sleep 10
		done
	fi	

	response=$(osascript -e 'display dialog "take a break, James!"' 2> /dev/null)
	[[ -z $response ]] && sleep $(echo ${snooze}*60 | bc)
	[[ -n $response ]] && sleep $(echo ${short_break}*60 | bc)
done

