## first ensure that one of the known bt headphones are connected
#pactl list | grep -qEi 'qy7|wraith' || ( zenity --notification --text='connect BT device!' && export err=1 )
#
#echo $err
#[ $err ] && exit



# find the id of the non-internal speakers (presumably BT headphones)
# and make that the default output device
# get id
id=$(pactl list sink-inputs | grep -Eom1 '[0-9]+')
sym=$(pactl list sinks | grep -i bluez | grep -i name | sed 's/Name://')

echo $id
echo $sym


pactl move-sink-input $id $sym || notify-send 'could NOT set BT!'
pactl set-default-sink $sym  || notify-send 'could NOT set BT!'

timeout .5 feh -. -x -g 100x100+1 ~/pics/icons/radio-tower.png
wait
/home/kessler/my_scripts/unlock.sh
