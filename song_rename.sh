#!/bin/bash


/usr/bin/exiftool \
	'-filename<${artist;tr( /\?*:|"<>,\0)()d}_${album;tr( /\\?*:|"<>,\0)()d}_${track;s/\/\d+//g;s/^(\d)$/0$1/g}${title;tr(\x27 /\\?*:|"<>,\0)()d}.%e' \
	-vm "$@"
