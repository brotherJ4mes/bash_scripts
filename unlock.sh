#!/bin/bash

source /home/kessler/.scriptsrc

#[[ $1 == "-f" ]] && rm /home/kessler/.kb

# new method to determine if external monitor is present (faster)

# below is failing right now:
dock=$(lsusb | grep -ic genesys)  # (the name of the dock)
[[ $dock -eq 0 ]] &&  /home/kessler/my_scripts/set_kb.sh w
[[ $dock -gt 0 ]] &&  /home/kessler/my_scripts/set_kb.sh m 

#set_kb.sh m

#/home/kessler/my_scripts/set_kb.sh m 
# run any other settings that dont seem to stick
for id in $(xinput | grep -iE 'mouse|logitech' | grep -Eo 'id=[0-9]+' | grep -Eo '[0-9]+'); do
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


