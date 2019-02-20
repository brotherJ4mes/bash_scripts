#!/bin/bash



timeout .5 feh -. -x -g 100x100+1 ~/pics/icons/keyboard.png
pgrep autokey | xargs kill 
nohup /bin/autokey-gtk &> /dev/null & 
