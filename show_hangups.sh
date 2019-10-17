#!/bin/bash
# show or hide sakura (hangups) depending on current state

source ~/.scriptsrc	
if [[ -n $(xprop -id $(xdotool search --name '^hangups$') | grep -i 'window state: Iconic') ]]; then
	xdotool search  --name '^hangups$' windowactivate
else
	xdotool search  --name '^hangups$' windowminimize
fi
