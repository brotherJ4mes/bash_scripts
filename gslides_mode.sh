#!/bin/bash


dir=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings


if [[ $1 == 'on' ]]; then
	pkill autocutsel
	dconf reset $dir/custom24/binding
	dconf reset $dir/custom15/binding

elif [[ $1 == 'off' ]]; then
	dconf write $dir/custom24/binding "'<Primary>period'"
	dconf write $dir/custom15/binding "'<Primary>comma'"
	/usr/local/bin/autocutsel -fork & # synchronize PRIMARY (mouse highlight) and CLIPBOARD (ctrl+c) 
	/usr/local/bin/autocutsel -selection PRIMARY -fork &


else 
	echo 'usage: gslides_mode.sh on|off'
fi
