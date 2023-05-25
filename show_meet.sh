#!/bin/bash
# show or hide 

str='^meet'
#str='Pithos'

#nwind=$(xdotool search --onlyvisible --name $str | wc -l)
#if [ $nwind -gt 1 ]; then /home/kessler/my_scripts/toast.sh hazard-sign.png; fi
#if [ $nwind -eq 0 ]; then /home/kessler/my_scripts/toast.sh hazard-sign.png; fi

source ~/.scriptsrc	
if [[ -n $(xprop -id $(xdotool search --onlyvisible --name $str) | grep -i 'window state: Iconic') ]]; then
	xdotool search  --onlyvisible --name $str windowactivate
else
	xdotool search  --onlyvisible --name $str windowminimize
fi
