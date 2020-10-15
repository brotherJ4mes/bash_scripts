
## try sleeping for 5 seconds
sleep 5; 

notify-send 'hello world!'
source ~/.scriptsrc


# increase screen res
#big 2> /dev/null

##start xbindkeys
#xbindkeys

# call unlock script 
rm ~/.kb # keyboard has not been configured
/home/kessler/my_scripts/unlock.sh

# start lock monitor (not sure this is actually doing anything anymore... just press the shortcut 
#nohup /home/kessler/my_scripts/daemon_unlock.sh &> /dev/null &

while true; do find ~/Downloads | entr -dp open_pdf.sh; done
