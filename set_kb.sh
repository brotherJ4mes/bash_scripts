#!/bin/bash 
timer=${2:-.2}
#timer=${2:-0}





case "$1" in 
	w)   # settings for using in laptop mode (i.e. windows keyboard)
	echo "win" > .kb
	~/my_scripts/toast.sh dungeon-light.png $timer
	xset -q | grep -Eo 'Caps Lock:\s+\w+' | grep on && xdotool key Caps_Lock # turn off caps if it's on
	killall xcape
	wmctrl -n 2                                                                                                                
        /usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['altwin:swap_alt_win, ctrl:nocaps, shift:both_capslock' ]"
	/bin/xmodmap ~/my_scripts/.xmodmap
        /home/kessler/.local/bin/xcape -e 'Control_L=Escape'
	[[ $(nmcli radio wifi) == disabled ]] && nmcli radio wifi on
	;;

	m) # settings for docked mode (i.e. mac keyboard)
	echo mac > .kb
	~/my_scripts/toast.sh shiny-apple.png $timer
	xset -q | grep -Eo 'Caps Lock:\s+\w+' | grep on && xdotool key Caps_Lock
        killall xbindkeys 2> /dev/null
        killall xcape
	wmctrl -n 1
        /usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['ctrl:nocaps, shift:both_capslock, apple:alupckeys' ]"
        /home/kessler/.local/bin/xbindkeys
	/bin/xmodmap ~/my_scripts/.xmodmap
        /home/kessler/.local/bin/xcape -e 'Control_L=Escape'
	[[ $(nmcli radio wifi) == disabled ]] || nmcli radio wifi off
	;;
esac
	
