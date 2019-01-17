#!/bin/bash

for prof_id in $(dconf list /org/gnome/terminal/legacy/profiles:/ | grep :); do
	dconf write /org/gnome/terminal/legacy/profiles:/${prof_id}word-char-exceptions '@ms "-#%&+,./:=?@_~"'
done

