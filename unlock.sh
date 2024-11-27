#!/bin/bash

source /home/kessler/.scriptsrc

#[[ $1 == "-f" ]] && rm /home/kessler/.kb

#/home/kessler/my_scripts/set_kb.sh m
#(if monitor connected with 2K res, assume docked)
[[ `xrandr | grep 2560` ]] && /home/kessler/my_scripts/set_kb.sh m
[[ `xrandr | grep 2560` ]] || /home/kessler/my_scripts/set_kb.sh w

wmctrl -l | grep -q Chat || /home/kessler/apps/chat



#/home/kessler/my_scripts/set_kb.sh m 
# run any other settings that dont seem to stick
#for id in $(xinput | grep -iE 'mouse|logitech' | grep -Eo 'id=[0-9]+' | grep -Eo '[0-9]+'); do
#	xinput set-prop $id "Evdev Scrolling Distance" -1 1 1;
#done



