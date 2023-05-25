#!/bin/bash

#mute=$(/usr/bin/amixer set Capture toggle | grep '\[off\]')

#mute='something'

if [[ -z $mute ]]; then
	toast.sh mic.png 
else
	toast.sh mic_mute.png
fi

