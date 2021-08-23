#!/bin/bash


if [[ -z $(pgrep pulseUi) ]]; then
	/usr/local/pulse/pulseUi
else
	xdotool search --onlyvisible --classname pulseUi windowactivate
fi
	

