#!/bin/bash

source /home/kessler/.scriptsrc

#[[ $1 == "-f" ]] && rm /home/kessler/.kb

# new method to determine if external monitor is present (faster)
dock=$(lsusb | grep -ic via)  # (viacomm is the name of the dock)
[[ $dock -eq 0 ]] &&  /home/kessler/my_scripts/set_kb.sh w 
[[ $dock -gt 1 ]] &&  /home/kessler/my_scripts/set_kb.sh m 

# run any other settings that dont seem to stick
id=$(xinput | grep -i mouse | grep -Eo 'id=[0-9]+' | grep -Eo '[0-9]+');
xinput set-prop $id "Evdev Scrolling Distance" -1 1 1;
  

synclient singletaptimeout=100
synclient palmdetect=1
synclient lockeddrags=1
synclient lockeddragtimeout=250

# OLD method too "slow" (took half a second)
## detect displays (and set keyboard mapping)
#ndisps=$(/bin/xrandr | grep -ic ' connected ')
#[[ ndisps -eq 1 ]] &&  /home/kessler/my_scripts/set_kb.sh w
#[[ ndisps -gt 1 ]] &&  /home/kessler/my_scripts/set_kb.sh m


