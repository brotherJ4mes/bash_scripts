#!/bin/bash 

source ~/.scriptsrc

case "$1" in 
	w)   # settings for using in laptop mode (i.e. windows keyboard)
	[[ $(cat ~/.kb) == 'win' ]] && toast.sh check-mark.png .5 && exit
	echo win > ~/.kb
	toast.sh dungeon-light.png .5 # show window icon during configuration
	xset -q | grep -Eo 'Caps Lock:\s+\w+' | grep on && xdotool key Caps_Lock # turn off caps if it's on
	killall xcape
	wmctrl -n 2  # change to 2 workspaces
        /usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['altwin:swap_alt_win, ctrl:nocaps, shift:both_capslock' ]"
        xcape -e 'Control_L=Escape'
	[[ $(nmcli radio wifi) == disabled ]] && nmcli radio wifi on
	/bin/xmodmap -e "keycode 112=Alt_R" # make pgup act as alt (its missing under remap)
	;;

	m) # settings for docked mode (i.e. mac keyboard)
	[[ $(cat ~/.kb) == 'mac' ]] && toast.sh check-mark.png .5 && exit
	echo mac > ~/.kb
	toast.sh shiny-apple.png .5 # show apple icon during configuration
	xset -q | grep -Eo 'Caps Lock:\s+\w+' | grep on && xdotool key Caps_Lock
        killall xcape
	wmctrl -n 1 # change to 1 workspace
        /usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['ctrl:nocaps, shift:both_capslock, apple:alupckeys' ]"
        xcape -e 'Control_L=Escape'  
	[[ $(nmcli radio wifi) == disabled ]] || nmcli radio wifi off
	;;
esac
	

#sleep .5 # sleep for just a second so that icon actuallly shows before killing it
#pkill -F ~/my_scripts/.toastpid # kill icon 


# do universal stuff
killall autocutsel
autocutsel -fork & # synchronize PRIMARY (mouse highlight) and CLIPBOARD (ctrl+c) 
autocutsel -selection PRIMARY -fork &
eset_kb.sh
