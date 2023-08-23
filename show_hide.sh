#!/bin/bash
# show or hide 
source ~/.scriptsrc	


case $1 in

	meet)
	str='^meet'
	;;

	msg)
	str='^Messages$|^Calls$|^Voicemail$|^Incoming\scall:|^Call\swith'
	;;

	music)
	str='^spotify$|Pithos|^ncspot$|Pandora|pianobar'
	;;

	*)
	echo arg not recognized
esac

nwind=$(xdotool search --onlyvisible --name "$str" | wc -l)
if [ $nwind -ne 1 ]; then /home/kessler/my_scripts/toast.sh hazard-sign.png; fi

source ~/.scriptsrc	
if [[ -n $(xprop -id $(xdotool search --name $str) | grep -i 'window state: Iconic') ]]; then
	xdotool search  --name $str windowactivate
else
	xdotool search  --name $str windowminimize
fi


