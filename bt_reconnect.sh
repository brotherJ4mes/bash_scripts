#!/bin/bash
function repair(){
	mac="$1"
	echo -e 'scan on\n'
	echo -e "remove $mac\n"
	sleep 8
	echo -e "pair $mac\n"
	sleep 3
	echo -e "trust $mac\n"
	sleep 1
	echo -e "connect $mac\n"
}


repair 34:88:5D:B5:EA:E3  # home office mouse
#repair 34:88:5D:B5:B2:A7 # work mouse

