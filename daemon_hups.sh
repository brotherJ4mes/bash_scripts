#!/bin/bash
dbus-monitor | 
while read line; 
	do echo $line | grep -i hangups && timeout .5 feh -. -x -g 100x100 /home/kessler/pics/icons/nothing-to-say.png; done

	# backdoor for runaways
	if [ -e /home/kessler/.backdoors/hups ]; then break; 
done




