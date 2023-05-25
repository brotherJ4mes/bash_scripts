#!/bin/bash 
case "$1" in 
	w) 
	killall xcape
        /bin/setxkbmap -option 'altwin:swap_alt_win, ctrl:nocaps, shift:both_capslock'
        /home/kessler/.local/bin/xcape -e 'Control_L=Escape'
        /bin/xmodmap ~/.Xmodmap_numpad
	timeout .5 feh -. -x -g 100x100+1 ~/pics/icons/window.png

	;;

	m)
        /bin/setxkbmap -option
        killall xbindkeys 2> /dev/null
        killall xcape
        /bin/setxkbmap -option 'ctrl:nocaps, shift:both_capslock, apple:alupckeys'
        /home/kessler/.local/bin/xcape -e 'Control_L=Escape'
        /home/kessler/.local/bin/xbindkeys
	timeout .5 feh -. -x -g 100x100+1 ~/pics/icons/shiny-apple.png
	;;
esac


	
