#!/bin/bash
# takes argument in and calls xdotool to navigate the menu bar with alt

sleep .5


case $1 in
		newslide)
			/usr/bin/xdotool key --clearmodifiers alt+s n
			;;
		super)
			/usr/bin/xdotool key --clearmodifiers alt+o s s
			;;
		sub)
			/usr/bin/xdotool key --clearmodifiers alt+o s r
			;;
		fnt+) # not working 
			/usr/bin/xdotool key --clearmodifiers shift+ctrl+greater

			;;
		fnt-) # not working 
			/usr/bin/xdotool key --clearmodifiers shift+ctrl+less
			;;
		repimg)
			/usr/bin/xdotool key --clearmodifiers alt+o M Z U
			;;
		*)
			echo else
			;;

esac


