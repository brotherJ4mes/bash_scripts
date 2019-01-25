#!/bin/bash 
timer=${2:-.2}
#timer=${2:-0}





case "$1" in 
	w)   # set for windows
	echo "win" > .kb
	timeout $timer feh -. -x -g 100x100+1 ~/pics/icons/dungeon-light.png 
	xset -q | grep -Eo 'Caps Lock:\s+\w+' | grep on && xdotool key Caps_Lock
	killall xcape
        /usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['altwin:swap_alt_win, ctrl:nocaps, shift:both_capslock']"
        /home/kessler/.local/bin/xcape -e 'Control_L=Escape'
	/bin/xmodmap ~/.Xmodmap_numpad
	;;

	m) # set for mac
	echo mac > .kb
	timeout $timer feh -. -x -g 100x100+1 ~/pics/icons/shiny-apple.png
	xset -q | grep -Eo 'Caps Lock:\s+\w+' | grep on && xdotool key Caps_Lock
        killall xbindkeys 2> /dev/null
        killall xcape
        /usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['ctrl:nocaps, shift:both_capslock, apple:alupckeys']"
        /home/kessler/.local/bin/xcape -e 'Control_L=Escape'
        /home/kessler/.local/bin/xbindkeys
	;;
esac
	
