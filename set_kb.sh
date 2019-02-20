#!/bin/bash 
timer=${2:-.2}
#timer=${2:-0}





case "$1" in 
	w)   # settings for using in laptop mode (i.e. windows keyboard)
	echo "win" > .kb
	timeout $timer feh -. -x -g 100x100+1 ~/pics/icons/dungeon-light.png 
	xset -q | grep -Eo 'Caps Lock:\s+\w+' | grep on && xdotool key Caps_Lock
	killall xcape
	wmctrl -n 2
        /usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['altwin:swap_alt_win, ctrl:nocaps, shift:both_capslock']"
        /home/kessler/.local/bin/xcape -e 'Control_L=Escape'
	/bin/xmodmap ~/.Xmodmap
	[[ $(nmcli radio wifi) == disabled ]] && nmcli radio wifi on
	;;

	m) # settings for docked mode (i.e. mac keyboard)
	echo mac > .kb
	timeout $timer feh -. -x -g 100x100+1 ~/pics/icons/shiny-apple.png
	xset -q | grep -Eo 'Caps Lock:\s+\w+' | grep on && xdotool key Caps_Lock
        killall xbindkeys 2> /dev/null
        killall xcape
	wmctrl -n 1
        /usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['ctrl:nocaps, shift:both_capslock, apple:alupckeys']"
        /home/kessler/.local/bin/xcape -e 'Control_L=Escape'
        /home/kessler/.local/bin/xbindkeys
	[[ $(nmcli radio wifi) == disabled ]] || nmcli radio wifi off
	;;
esac
	
