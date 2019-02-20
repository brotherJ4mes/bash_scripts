
## try sleeping for 5 seconds
sleep 5; 

notify-send 'hello world!'
source ~/.bashrc


# increase screen res
#big 2> /dev/null

##start xbindkeys
xbindkeys

# call unlock script 
/home/kessler/my_scripts/unlock.sh

# start lock monitor
nohup /home/kessler/my_scripts/daemon_unlock.sh &> /dev/null &
nohup /home/kessler/my_scripts/daemon_hups.sh &> /dev/null &
