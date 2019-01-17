!/bin/bash
source ~/.bashrc
zenity --notification --text='SWOPERA STARTED!'
rm ~/.kill_swopera 2> /dev/null # remove backdoor

op_active=0 # assume opera not active to start

while true; do
	sleep .05
	
	# store old state
	old=$op_active
	
	# set op_active if neccessary
	xdotool getactivewindow getwindowname | grep -Eiq 'opera|calc' && op_active=1 || op_active=0	

	# check if op_active has changed
	if [ "$op_active" -ne "$old" ]; then
		[[ "$op_active" -eq 1 ]] && mac && echo 'OPERA or CALC!'
		[[ "$op_active" -eq 0 ]] && win && echo 'ELSE!'
	fi
	
	# backdoor to exit loop (touch ~/.kill_swopera) 
	[[ -f ~/.kill_swopera ]] && break

done


zenity --notification --text='Swopera ENDED!'
