#!/bin/bash
icon="/home/kessler/pics/icons/$1"
timer=$2


timeout $2 /home/kessler/.linuxbrew/bin/feh -. -x -g 100x100 $icon & # sleep .5; xdotool key super+Tab
