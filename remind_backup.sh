#!/bin/bash

# this SHOULD have been able to be a single command in the cron...grrr
[ $(/usr/bin/date +%d) -le 7 ] && /usr/bin/zenity --warning --text='First Monday! \nBack things up' --no-wrap 2> /dev/null
