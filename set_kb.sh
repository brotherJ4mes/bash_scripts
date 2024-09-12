#!/bin/bash 

source ~/.scriptsrc


#case "$1" in 
#	m) # settings for docked mode (i.e. mac keyboard)
		toast.sh bowen-knot.png .5 # show apple icon during configuration
			/usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['ctrl:nocaps, shift:both_capslock, apple:alupckeys', 'terminate:ctrl_alt_bksp', 'numpad:mac']"
		#[[ $(nmcli radio wifi) == disabled ]] || nmcli radio wifi off
		echo mac > ~/.kb
		#xrandr --output eDP-1 --off
		#xrandr -s 2560x1440
#	;;

#esac
	

#sleep .5 # sleep for just a second so that icon actuallly shows before killing it
#pkill -F ~/my_scripts/.toastpid # kill icon 


# do universal stuff
killall autocutsel
/usr/bin/autocutsel -selection CLIPBOARD -fork -p 10 # synchronize PRIMARY (mouse highlight) and CLIPBOARD (ctrl+c) 
/usr/bin/autocutsel -selection PRIMARY -fork -p 10

# restart xbindkeys/xmodmap and xcape
pkill xbindkeys; /usr/bin/xbindkeys
/usr/bin/xmodmap -e "keycode 169 = dead_greek dead_greek dead_greek dead_greek"
killall xcape; /usr/bin/xcape -e 'Control_L=Escape'

killall autokey-gtk # can't figure out how autokey is starting but don't want to uninstall in case i wnat it someday!

# daemon section (using systemctl is a pain due to env differences)
#pkill dl_watch.sh
#pkill entr
#pkill dl_open.sh
#/usr/bin/gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 13'
#nohup ~/my_scripts/dl_watch.sh &> /dev/null &
