#!/bin/bash
# show or hide sakura (hangups) depending on current state

#str=$1
str='^Messages$|^Calls$|^Voicemail$|^Incoming\scall:'
#str='^Messages$'


nwind=$(xdotool search --onlyvisible --name "$str" | wc -l)
if [ $nwind -ne 1 ]; then /home/kessler/my_scripts/toast.sh hazard-sign.png; fi


source ~/.scriptsrc	
if [[ -n $(xprop -id $(xdotool search --name $str) | grep -i 'window state: Iconic') ]]; then
	xdotool search  --name $str windowactivate
else
	xdotool search  --name $str windowminimize
fi



#source ~/.scriptsrc	
#if [[ -n $(xprop -id $(xdotool search --name '^hangups$') | grep -i 'window state: Iconic') ]]; then
#	xdotool search  --name '^hangups$' windowactivate
#else
#	xdotool search  --name '^hangups$' windowminimize
#fi
