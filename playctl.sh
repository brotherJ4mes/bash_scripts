#!/bin/bash

export LD_LIBRARY_PATH=/usr/local/lib64; 

if [[ $1 == 'next' ]]; then
#	/usr/bin/notify-send next track
	/usr/local/bin/playerctl -a $1
	echo -n 'n' > $HOME/.config/pianobar/ctl 
	#/usr/local/bin/playerctl -a $1;
   	#/usr/bin/xdotool key --delay 100 --clearmodifiers ctrl+period;
fi

if [[ $1 == 'play-pause' ]]; then
	#/usr/local/bin/playerctl -a  $1 
	/usr/local/bin/playerctl -i chromium  $1 
	echo -n 'p' > $HOME/.config/pianobar/ctl 
fi

if [[ $1 == 'previous' ]]; then
	/usr/local/bin/playerctl -a  $1 
fi

