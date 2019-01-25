#!/bin/bash
/home/kessler/.linuxbrew/bin/gdbus monitor -y -d org.freedesktop.login1 | \
while read line; do 
	if echo $line | grep -q Unlock; then 
		sleep 1
		#notify-send 'Unlocked!'; # remove this later
		/home/kessler/my_scripts/unlock.sh
	fi;  

	# backdoor for runaways
	if [ -e /home/kessler/.backdoors/monitor_lock ]; then break; notify-send 'exiting monitor_lock'; fi
done




