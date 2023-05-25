#!/bin/bash 


#timer=${2:-.2}
#timer=${2:-0}

wd=/home/kessler/my_scripts

#${wd}/toast.sh thumb-up.png 0

case "$1" in 
	w)   # settings for using in laptop mode (i.e. windows keyboard)
	${wd}/toast.sh dungeon-light.png 0 # show window icon during configuration
	xset -q | grep -Eo 'Caps Lock:\s+\w+' | grep on && xdotool key Caps_Lock # turn off caps if it's on
	killall xcape
	wmctrl -n 2                                                                                                                
        /usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['altwin:swap_alt_win, ctrl:nocaps, shift:both_capslock' ]"
        /home/kessler/.local/bin/xcape -e 'Control_L=Escape'
	#/bin/xmodmap -p | grep Alt_L && /bin/xmodmap /home/kessler/.Xmodmap # run xmodmap if necessary (moved to restart_ak)
	[[ $(nmcli radio wifi) == disabled ]] && nmcli radio wifi on
	#pkill -F ${wd}/.toastpid # kill icon 
	;;

	m) # settings for docked mode (i.e. mac keyboard)
	${wd}/toast.sh shiny-apple.png 0 # show apple icon during configuration
	xset -q | grep -Eo 'Caps Lock:\s+\w+' | grep on && xdotool key Caps_Lock
        killall xbindkeys 
        killall xcape
	wmctrl -n 1
        /usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['ctrl:nocaps, shift:both_capslock, apple:alupckeys' ]"
        /home/kessler/.local/bin/xcape -e 'Control_L=Escape'
        /home/kessler/.local/bin/xbindkeys
	/bin/xmodmap -e "keycode 112=Alt_R"
	#/bin/xmodmap -p | grep Alt_L && /bin/xmodmap /home/kessler/.Xmodmap # run xmodmap if necessary (moved to restart_ak)
	#/bin/xmodmap -p | grep Alt_L && /bin/xmodmap /home/kessler/.Xmodmap # run xmodmap if necessary (moved to restart_ak)
	[[ $(nmcli radio wifi) == disabled ]] || nmcli radio wifi off
	;;
esac
	
#${wd}/toast.sh thumb-up.png 0

sleep .5 # sleep for just a second so that icon actuallly shows
pkill -F ${wd}/.toastpid # kill icon 
