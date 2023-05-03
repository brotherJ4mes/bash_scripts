#!/bin/bash 

source ~/.scriptsrc

case "$1" in 
	w)   # settings for using in laptop mode (i.e. windows keyboard)
	toast.sh windows-95.png .75 # show window icon during configuration
	#xset -q | grep -Eo 'Caps Lock:\s+\w+' | grep on && xdotool key Caps_Lock # turn off caps if it's on
	killall xcape
        /usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['altwin:swap_alt_win, ctrl:nocaps, shift:both_capslock', 'terminate:ctrl_alt_bksp','ctrl:rctrl_ralt']"

        xcape -e 'Control_L=Escape'
	[[ $(nmcli radio wifi) == disabled ]] && nmcli radio wifi on
	#/usr/bin/xmodmap -e "keycode 112=Alt_R" # make pgup act as alt (its missing under remap)
	/usr/bin/xmodmap -e "keycode 169 = dead_greek dead_greek dead_greek dead_greek"
	xrandr --output eDP-1 --auto
	echo win > ~/.kb
	#fnt 14
	#/bin/wmctrl -n 2
	;;

	m) # settings for docked mode (i.e. mac keyboard)
	toast.sh bowen-knot.png .75 # show apple icon during configuration
        killall xcape
        /usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['ctrl:nocaps, shift:both_capslock, apple:alupckeys', 'terminate:ctrl_alt_bksp']"
        xcape -e 'Control_L=Escape'  
	[[ $(nmcli radio wifi) == disabled ]] || nmcli radio wifi off
	/usr/bin/xmodmap -e "keycode 169 = dead_greek dead_greek dead_greek dead_greek"
	echo mac > ~/.kb
	#fnt 13
	#/bin/wmctrl -n 1
	xrandr --output eDP-1 --off
	xrandr -s 2560x1440
	;;
esac
	

#sleep .5 # sleep for just a second so that icon actuallly shows before killing it
#pkill -F ~/my_scripts/.toastpid # kill icon 


# do universal stuff
killall autocutsel
/usr/local/bin/autocutsel -fork & # synchronize PRIMARY (mouse highlight) and CLIPBOARD (ctrl+c) 
/usr/local/bin/autocutsel -selection PRIMARY -fork &

# daemon section (using systemctl is a pain due to env differences)
pkill dl_watch.sh
pkill entr
pkill dl_open.sh
/usr/bin/gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 13'
#nohup ~/my_scripts/dl_watch.sh &> /dev/null &
