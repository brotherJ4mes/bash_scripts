#!/bin/bash

# simple:  kill the current nautilus and launch a new one everytime (can be annoying)
#/bin/nautilus -q
#/bin/nautilus -n ~



## sophisticated: never launch a new window (can be slow)
#pid=$(pgrep -x nautilus | tail -n 1)
#echo $pid
#if [[ -z $pid ]]; then # if nautilus is not running open it @ home dir
#	/bin/nautilus -n ~ &
#else # else give it focus and open a new tab
#	# option b:  
#	wmctrl -i -R  `wmctrl -lp | grep $pid | cut -d' ' -f1`
#fi


# best (i think)....
# search for existing window || open a new one
#wmctrl -xR nautilus.Nautilus || /bin/nautilus 

wmctrl -xR nautilus.Nautilus || /bin/nautilus 


