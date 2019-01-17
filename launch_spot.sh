/bin/google-chrome & # open chrome
sleep 1 
xdotool key control+shift+s  # open web player extensions
sleep 1
wmctrl -c Google Chrome    # close original window
wmctrl -r :ACTIVE: -e 0,10000,10000,750,450  # resize to bottom right corner

