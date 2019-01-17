#!/bin/bash

# turn trackpad off
if ! [ -f ~/.tp_off ]; then
	xinput disable 10;
	timeout .25 feh -. -x -g 100x100+1 ~/pics/icons/click_red.png
	touch ~/.tp_off
		
# turn trackpad on
else
	xinput enable 10;
	timeout .25 feh -. -x -g 100x100+1 ~/pics/icons/click_green.png
	rm ~/.tp_off
fi
	
