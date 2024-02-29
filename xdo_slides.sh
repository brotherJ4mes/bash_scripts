#!/bin/bash
# takes argument in and calls xdotool to navigate the menu bar with alt

sleep .2


case $1 in
		newslide)
			/usr/bin/xdotool key --clearmodifiers alt+s alt+n
			;;
		super)
			/usr/bin/xdotool key --clearmodifiers alt+o s s
			;;
		sub)
			/usr/bin/xdotool key --clearmodifiers alt+o s r
			;;
		fnt+) # almos working 
			/usr/bin/xdotool key  shift+ctrl+period
			#/usr/bin/xdotool key --clearmodifiers alt+o s o i

			;;
		fnt-) # not working 
			/usr/bin/xdotool key  shift+ctrl+comma
			#/usr/bin/xdotool key u-clearmodifiers shift+ctrl+less
			;;
		repimg)
			/usr/bin/xdotool key --clearmodifiers alt+o M Z U
			;;
		*)
			echo else
			;;

esac


