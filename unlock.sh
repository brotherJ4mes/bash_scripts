#!/bin/bash
#source /home/kessler/.bashrc

timer=${1:-.1}


# reset autokey
pgrep autokey | xargs kill 
/bin/autokey-gtk 2> /dev/null &


# new method to determine if external monitor is present (faster)
dock=$(lsusb | grep -ic via)
[[ $dock -eq 0 ]] &&  time /home/kessler/my_scripts/set_kb.sh w $timer
[[ $dock -gt 1 ]] &&  time /home/kessler/my_scripts/set_kb.sh m $timer

# run any other settings that dont seem to stick
ids=$(xinput | grep -i logitech | grep -Eo '=[0-9]{1,2}' | grep -Eo '[0-9]+');
    for id in $ids;
    do
        xinput set-prop $id "Evdev Scrolling Distance" -1 1 1;
    done


synclient singletaptimeout=100
synclient palmdetect=1
synclient lockeddrags=1
synclient lockeddragtimeout=250

# OLD method too "slow" (took half a second)
## detect displays (and set keyboard mapping)
#ndisps=$(/bin/xrandr | grep -ic ' connected ')
#[[ ndisps -eq 1 ]] &&  /home/kessler/my_scripts/set_kb.sh w
#[[ ndisps -gt 1 ]] &&  /home/kessler/my_scripts/set_kb.sh m


