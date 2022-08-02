#!/bin/bash
source ~/.scriptsrc # load paths


#timeout .5 /home/kessler/.linuxbrew/bin/feh -. -x -g 100x100+1 ~/pics/icons/keyboard.png
toast.sh reset.png .75
scrfix
pkill autokey 
pkill xbindkeys
#/bin/xmodmap -p | grep Alt_L && /bin/xmodmap /home/kessler/.Xmodmap # run xmodmap if necessary
/bin/autokey-gtk & #> /dev/null & 
xbindkeys
