#!/bin/bash
dbus-monitor | 
while read line; 
	do echo $line | grep -i hangups && ~/my_scripts/toast.sh nothing-to-say.png .5; done

	# backdoor for runaways
	if [ -e /home/kessler/.backdoors/hups ]; then break; 
done




