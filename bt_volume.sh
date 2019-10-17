#!/bin/bash


#killall feh 2> /dev/null


# first try to find bluetooth sink (non-zero, possibly two digits)
#  search for the patter #NN in between the words sink and 'bluez' to determine the sink index for BT
#idx=$(pactl list sinks | sed -nr '/^Sink/,/bluez/p; /bluez/q' | grep -Eo '#[0-9]+' | tr -d '#')
idx=$(pactl list sinks | grep -i "RUNNING" -B1 | grep -oE '[0-9]+')

# otherwise adjust global volume (idx = 0)
[[ -z $idx ]] && idx=1

echo $idx
echo $1

[[ "$1" == "mute" ]] && pactl set-sink-mute $idx toggle
[[ "$1" == "up" ]] && pactl set-sink-volume $idx +3%
[[ "$1" == "down" ]] && pactl set-sink-volume $idx -3%

# get stats (vol lvl and mute)
stats=$(pactl list sinks | sed -n "/^Sink #$idx/,/^Sink/p" | sed -nr '/^\s+Volume/p;/^\s+Mute/p')
#echo $stats | grep -iq 'Mute: yes' && timeout .5 feh -. -x -g 100x100 ~/pics/icons/mute.png 
echo $stats | grep -iq 'Mute: yes' && ~/my_scripts/toast.sh mute.png .25

lvl=$(echo $stats | grep -oE '[0-9]{1,3}%' | head -n1)
#timeout .25 feh -. -x -g 100x100 ~/pics/icons/headphones.png --info "echo '    $lvl'" -e "yudit/18"
timeout .5 ~/.linuxbrew/bin/feh -. -x -g 150x150-1 ~/pics/icons/headphones.png --info "echo '     $lvl'" -e "yudit/24"








