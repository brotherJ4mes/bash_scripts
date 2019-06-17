#!/bin/bash

# turn trackpad off
if ! [ -f ~/.tp_off ]; then
	xinput disable 17;
	#timeout .25 feh -. -x -g 100x100+1 ~/pics/icons/click_red.png
	~/my_scripts/toast.sh click_red.png .25
	touch ~/.tp_off
		
# turn trackpad on
else
	xinput enable 17;
	#timeout .25 feh -. -x -g 100x100+1 ~/pics/icons/click_green.png
	~/my_scripts/toast.sh click_green.png .25
	rm ~/.tp_off
fi
	
