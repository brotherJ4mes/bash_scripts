#!/bin/bash

source ~/.bashrc
setxkbmap -option
xdotool key --clearmodifiers space
killall xbindkeys
killall xcape
touch ~/.kill_swopera
mac

zenity --notification --text='KEYBOARD HAS BEEN RESET!'
