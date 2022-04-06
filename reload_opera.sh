tmp=$(xdotool getactivewindow); 
wmctrl -R opera
sleep .2
/usr/bin/xdotool key ctrl+r
sleep .2
/usr/bin/xdotool windowactivate $tmp



#/usr/bin/xdotool windowactivate --sync $(/usr/bin/xdotool search --onlyvisible --name opera) key ctrl+r; 
