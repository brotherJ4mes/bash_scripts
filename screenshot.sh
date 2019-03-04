#!/bin/bash
# read in args and take a screenshot

args="$@"
savedir=$HOME/pics/screenshots/

echo -e "\0007"
date +%b%d_%H%M%S | xargs -iz  gnome-screenshot $args -f ${savedir}/z.png

#timeout .5 feh -. -x -g 100x100+1 ~/pics/icons/photo-camera.png
~/my_scripts/toast.sh photo-camera.png .5


