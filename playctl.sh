#!/bin/bash

export LD_LIBRARY_PATH=/usr/local/lib64; 

if [[ $1 == 'next' ]]; then
	/usr/local/bin/playerctl -a $1 || echo -n 'n' > $HOME/.config/pianobar/ctl 
fi

if [[ $1 == 'play-pause' ]]; then
	/usr/local/bin/playerctl -a  $1 || echo -n 'p' > $HOME/.config/pianobar/ctl 
fi

if [[ $1 == 'previous' ]]; then
	/usr/local/bin/playerctl -a  $1 
fi

