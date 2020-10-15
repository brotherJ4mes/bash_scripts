#!/bin/bash


# mute/unmute mic: (simple way `amixer set Capture toggle`, but so slow for some reason)
if [[ $1 == 'mic' ]]; then
	amixer set Capture toggle
	amixer get Capture | grep -q '\[off\]' && ~/my_scripts/toast.sh mic_mute.png .5 
	amixer get Capture | grep -q '\[off\]' || ~/my_scripts/toast.sh mic_mute.png .5 
	exit 0
fi



# control output volume
[[ "$1" == "mute" ]] &&  amixer set Master toggle
[[ "$1" == "up" ]] &&  amixer set Master 3%+
[[ "$1" == "down" ]] && amixer set Master 3%-

lvl=$(amixer get Master | grep -io -m1 '[0-9]\+\%') # get percentage 
amixer get Master | grep '\[off\]' && ~/my_scripts/toast.sh mute.png .5 &
timeout .5 ~/.linuxbrew/bin/feh -. -x -g 150x150-1 ~/pics/icons/headphones.png --info "echo '     $lvl'" -e "yudit/24"




# oldway using pactl (confusing since i had to search for the "sink" to control 
##killall feh 2> /dev/null
# first try to find bluetooth sink (non-zero, possibly two digits)
##  search for the patter #NN in between the words sink and 'bluez' to determine the sink index for BT
##idx=$(pactl list sinks | sed -nr '/^Sink/,/bluez/p; /bluez/q' | grep -Eo '#[0-9]+' | tr -d '#')
#idx=$(pactl list sinks | grep -i "RUNNING" -B1 | grep -oE '[0-9]+')
#
## otherwise adjust global volume (idx = 0)
#[[ -z $idx ]] && idx=1
#
#echo $idx
#echo $1
#
#[[ "$1" == "mute" ]] && pactl set-sink-mute $idx toggle
#[[ "$1" == "up" ]] && pactl set-sink-volume $idx +3%
#[[ "$1" == "down" ]] && pactl set-sink-volume $idx -3%
#
## get stats (vol lvl and mute)
#stats=$(pactl list sinks | sed -n "/^Sink #$idx/,/^Sink/p" | sed -nr '/^\s+Volume/p;/^\s+Mute/p')
#echo $stats | grep -iq 'Mute: yes' && timeout .5 feh -. -x -g 100x100 ~/pics/icons/mute.png 
#echo $stats | grep -iq 'Mute: yes' && ~/my_scripts/toast.sh mute.png .25

#lvl=$(echo $stats | grep -oE '[0-9]{1,3}%' | head -n1)
#timeout .25 feh -. -x -g 100x100 ~/pics/icons/headphones.png --info "echo '    $lvl'" -e "yudit/18"
#timeout .5 ~/.linuxbrew/bin/feh -. -x -g 150x150-1 ~/pics/icons/headphones.png --info "echo '     $lvl'" -e "yudit/24"








