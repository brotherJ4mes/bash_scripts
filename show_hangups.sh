#!/bin/bash

#if [[ -e ~/.minimized ]]; then
#	/home/kessler/.linuxbrew/bin/xdotool search --name hangups windowactivate
#	rm ~/.minimized
#else 
#	/home/kessler/.linuxbrew/bin/xdotool search --name hangups windowminimize
#	touch ~/.minimized
#fi



source ~/.scriptsrc	
if [[ -n $(xprop -id $(xdotool search --name hangups) | grep 'Iconic') ]]; then
	xdotool search  --name hangups windowactivate
else
	xdotool search  --name hangups windowminimize
fi

