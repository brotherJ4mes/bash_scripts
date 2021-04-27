tmp=$(xdotool getactivewindow); 
/usr/bin/xdotool windowactivate --sync $(/usr/bin/xdotool search meet) key ctrl+d; 
/usr/bin/xdotool windowactivate $tmp
