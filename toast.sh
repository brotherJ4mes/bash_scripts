#!/bin/bash
icon="/home/kessler/images/icons/$1"
#timer=${2:-1}
timer=${2:-.5}


timeout $timer /usr/local/bin/feh -. -x -g 150x150-1 $icon # & echo $! > ~/my_scripts/.toastpid

#sleep .1
#/home/kessler/.linuxbrew/bin/xdotool key Super+Tab
