#!/bin/bash


notify-send 'starting unlock daemon now...'



/bin/gdbus monitor -y -d org.freedesktop.login1 | \
while read line; do 
	if echo $line | grep -q Unlock; then 
		sleep 1
		notify-send `cat ~/.lastunlock`; 
		/home/j4mes/my_scripts/unlock.sh
	elif echo $line | grep -q Lock; then 
		touch ~/locked_it
		date '+%b-%d %H:%M' > ~/.lastunlock	
		pkill vlc
		pkill chrome
	fi;  

	# backdoor for runaways
	if [ -e /home/j4mes/.backdoors/monitor_lock ]; then break; notify-send 'exiting monitor_lock'; fi
done




