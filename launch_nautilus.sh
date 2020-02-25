#!/bin/bash

pid=$(pgrep -x nautilus | tail -n 1)
echo $pid


if [[ -z $pid ]]; then # if nautilus is not running open it @ home dir
	/bin/nautilus -n ~ &
else # else give it focus and open a new tab
	# option b:  
	wmctrl -i -R  `wmctrl -lp | grep $pid | cut -d' ' -f1`
fi
