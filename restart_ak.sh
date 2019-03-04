#!/bin/bash



#timeout .5 /home/kessler/.linuxbrew/bin/feh -. -x -g 100x100+1 ~/pics/icons/keyboard.png
~/my_scripts/toast.sh keyboard.png .5
pgrep autokey | xargs kill 
killall xbindkeys
nohup /bin/autokey-gtk &> /dev/null & 
/home/kessler/.local/bin/xbindkeys
