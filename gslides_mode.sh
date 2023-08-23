#!/bin/bash


dir=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings

# determine the numbers of the custom keybindings
num_next=$(dconf dump / | grep -i -B3 'next track' | sed -n '/.*custom/p' | grep -Eo '[0-9]+')
num_prev=$(dconf dump / | grep -i -B3 'previous track' | sed -n '/.*custom/p' | grep -Eo '[0-9]+')


echo $num_next
echo $num_prev

if [[ $1 == 'on' ]]; then
	pkill autocutsel
	dconf reset $dir/custom$num_next/binding
	dconf reset $dir/custom$num_prev/binding

elif [[ $1 == 'off' ]]; then
	dconf write $dir/custom${num_prev}/binding "'<Primary>period'"
	dconf write $dir/custom$num_next/binding "'<Primary>comma'"
	/usr/local/bin/autocutsel -fork & # synchronize PRIMARY (mouse highlight) and CLIPBOARD (ctrl+c) 
	/usr/local/bin/autocutsel -selection PRIMARY -fork &


else 
	echo 'usage: gslides_mode.sh on|off'
fi
