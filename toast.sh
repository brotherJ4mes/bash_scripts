#!/bin/bash
icon="/home/j4mes/images/icons/$1"
#timer=${2:-1}
timer=${2:-.5}


timeout $timer /usr/bin/feh -. -x -g 150x150-1 $icon # & echo $! > ~/my_scripts/.toastpid

