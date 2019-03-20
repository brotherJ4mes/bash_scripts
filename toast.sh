#!/bin/bash
icon="/home/kessler/pics/icons/$1"
timer=$2

timeout $2 /home/kessler/.linuxbrew/bin/feh -. -x -g 100x100 $icon & echo $! > ~/my_scripts/.toastpid

#sleep .1
#/home/kessler/.linuxbrew/bin/xdotool key Super+Tab
