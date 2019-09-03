
## try sleeping for 5 seconds
sleep 5; 

notify-send 'hello world!'
source ~/.bashrc


# increase screen res
#big 2> /dev/null

##start xbindkeys
#xbindkeys

# call unlock script 
rm ~/.kb # keyboard has not been configured
/home/kessler/my_scripts/unlock.sh

# start lock monitor
nohup /home/kessler/my_scripts/daemon_unlock.sh &> /dev/null &
# start hangups monitor (no longer necessary---use phone noises)
#nohup /home/kessler/my_scripts/daemon_hups.sh &> /dev/null &
