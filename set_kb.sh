
#!/bin/bash 

source ~/.scriptsrc



case "$1" in 
	w)   # settings for using in laptop mode (i.e. windows keyboard)
		toast.sh windows-95.png .5 # show window icon during configuration

		# turn on locked dragging (only useful in laptop mode)
		id=$(xinput | grep Touchpad | sed -r "s/.*id=([0-9]+).*$/\1/")
		prop_id=$(xinput --list-props $id | grep "Drag Lock Enable" -m1 | egrep -o "[0-9]+" | head -n1)
		echo setting prop $prop_id for input $id
		xinput --set-prop $id $prop_id 1

		#xset -q | grep -Eo 'Caps Lock:\s+\w+' | grep on && xdotool key Caps_Lock # turn off caps if it's on
			#/usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['altwin:swap_alt_win, ctrl:nocaps, shift:both_capslock', 'terminate:ctrl_alt_bksp','ctrl:rctrl_ralt']"
			/usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['altwin:swap_alt_win, ctrl:nocaps, shift:both_capslock', 'terminate:ctrl_alt_bksp']"
		[[ $(nmcli radio wifi) == disabled ]] && nmcli radio wifi on
		xrandr --output eDP-1 --auto
		echo win > ~/.kb
		# set locked drags
		tp_id=$(xinput | grep Touchpad | sed -nr 's/.*id=([0-9]+).*/\1/p')
		xinput --set-prop $tp_id 340 1
		
	;;

	m) # settings for docked mode (i.e. mac keyboard)
		toast.sh bowen-knot.png .5 # show apple icon during configuration
			/usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['ctrl:nocaps, shift:both_capslock, apple:alupckeys', 'terminate:ctrl_alt_bksp', 'numpad:mac']"
		#[[ $(nmcli radio wifi) == disabled ]] || nmcli radio wifi off
		echo mac > ~/.kb
		xrandr --output eDP-1 --off
		#xrandr -s 2560x1440
	;;


	hyb)
		echo hybrid mode
		#toast.sh windows-95.png .5 # show window icon during configuration
		#xset -q | grep -Eo 'Caps Lock:\s+\w+' | grep on && xdotool key Caps_Lock # turn off caps if it's on
			#/usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['altwin:swap_alt_win, ctrl:nocaps, shift:both_capslock', 'terminate:ctrl_alt_bksp','ctrl:rctrl_ralt']"
			/usr/bin/gsettings set org.gnome.desktop.input-sources  xkb-options "['altwin:swap_alt_win, ctrl:nocaps, shift:both_capslock', 'terminate:ctrl_alt_bksp']"
		[[ $(nmcli radio wifi) == disabled ]] && nmcli radio wifi on
		xrandr --output eDP-1 --off
		echo win > ~/.kb
		# set locked drags
		tp_id=$(xinput | grep Touchpad | sed -nr 's/.*id=([0-9]+).*/\1/p')
		xinput --set-prop $tp_id 340 1

esac
	

#sleep .5 # sleep for just a second so that icon actuallly shows before killing it
#pkill -F ~/my_scripts/.toastpid # kill icon 


# do universal stuff
killall autocutsel
/usr/local/bin/autocutsel -selection CLIPBOARD -fork -p 10 # synchronize PRIMARY (mouse highlight) and CLIPBOARD (ctrl+c) 
/usr/local/bin/autocutsel -selection PRIMARY -fork -p 10

# restart xbindkeys/xmodmap and xcape
pkill xbindkeys; /usr/local/bin/xbindkeys
/usr/bin/xmodmap -e "keycode 169 = dead_greek dead_greek dead_greek dead_greek"
killall xcape; /usr/bin/xcape -e 'Control_L=Escape'

killall autokey-gtk # can't figure out how autokey is starting but don't want to uninstall in case i wnat it someday!

xdotool key --clearmodifiers Tab # try a random xdotool to clear the CTL modifier (seems to get stuck in the down pos?)

# daemon section (using systemctl is a pain due to env differences)
#pkill dl_watch.sh
#pkill entr
#pkill dl_open.sh
#/usr/bin/gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 13'
#nohup ~/my_scripts/dl_watch.sh &> /dev/null &
