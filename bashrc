[[ -z $PS1 ]] && return

sleep .2

# ==============================================================
# sshing and profile management:
# ==============================================================

function chp(){
#sleep .2
[[ -f ~/.sunny ]] && prof_num=2 || prof_num=$1
/bin/xdotool keyup Super
/bin/xdotool key --clearmodifiers shift+F10 r $prof_num
#xdotool key shift+F10 r $1
}
chp 1
#eval `dircolors -b /etc/DIR_COLORS`



# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
source /etc/bash_completion


__complete_ssh_host() {
    # source https://blog.petdance.com/2019/10/31/tab-completion-for-ssh-scp/
    local CONFIG_FILE=~/.ssh/config
    if [ -r $CONFIG_FILE ] ; then
        local CONFIG_LIST=`awk '/^host [A-Za-z]+/ {print $2}' $CONFIG_FILE`
    fi
    local PARTIAL_WORD="${COMP_WORDS[COMP_CWORD]}";
    COMPREPLY=( $(compgen -W "$CONFIG_LIST" -- "$PARTIAL_WORD") )
    return 0
}
complete -F __complete_ssh_host ssh
complete -f -F __complete_ssh_host scp # preserves autocomplete for local files (good)





export GL='jamkessl@greatlakes-xfer.arc-ts.umich.edu:/home/jamkessl/'
export MASON='99.104.238.238'
export PREC='kess-jame-r8-l1'
export IPOD_MOUNTPOINT='/media/j4mes/IPOD/'
#export APOLLO='cone@pine64:/home/cone/Apollo/'
export ROCK='192.168.1.66'
export PINE='192.168.4.247' # might change (this is plugged into couch ethernet)
export APOLLO="pebble@$ROCK:/media/apollo/"
alias rock="chp 2; ssh pebble@$ROCK"

export PS1="[\u@\W :]"

PROMPT_COMMAND='echo -en "\033]0; local \a"'
#/home/kessler/.linuxbrew/sbin/:

export ml_path="
/home/j4mes/.local/bin:
/usr/bin:
/bin:
/home/j4mes/my_scripts/:
/home/j4mes/apps/:
/sbin:
/usr/local/bin:
/usr/local/sbin:
/usr/sbin:
/opt/tectia/bin:
/opt/cisco/anyconnect/bin/:
.
"

export PATH=$(echo $ml_path | tr -d ' ')
#export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/home/kessler/.linuxbrew/lib/pkgconfig/"
export TEXINPUTS=.:$HOME/.local/share/tex:
export PYTHONSTARTUP=$HOME/.pythonrc
#export LIBRARY_PATH=$HOME/.linuxbrew/lib/:/lib:/usr/lib/
#export CPATH=$HOME/.linuxbrew/include:/usr/include/
export PRINTER='envy'
export EDITOR='/usr/bin/vim'

export R_LIBS_USER=$HOME/.local/lib/R
export R_HISTFILE=$HOME/.Rhistory
export LD_LIBRARY_PATH=/usr/local/lib64/:$HOME/.local/lib
#export PKG_CONFIG_PATH=/usr/lib64/pkgconfig/
#export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig


shopt -s extglob



# ssh
# keep pass from opening dialogue
#pass(){ export DISPLAY=''; /usr/local/bin/pass "$@"; export DISPLAY=:0; }
alias pass_update="rsync -av kessler@$PREC:/home/kessler/.password-store ~/"



#/home/kessler/.linuxbrew/bin/:
alias one2='xrandr --output eDP-1 --scale 1.2x1.2'
alias mubig='mupdf -r 300'



#export xps='192.168.4.26'
export RPT='10.0.21.151'
export HUSKY_IP=172.16.4.55
alias husky='pass -c noaa/husky; chp 8; ssh -qY -p 7722 $HUSKY_IP; chp 1'
alias rhpt='chp 8; ssh -qY $RPT; chp 1'
alias be='chp 2; ssh -qY bear; chp 1'
alias bep='chp 4; ssh -qY bear-pre; chp 1'
alias camel='pass -c noaa/camel; chp 5; ssh -Y camel.sci.dmz; chp 1'
alias che='chp 6; ssh -Y jamkessl@cheyenne.ucar.edu; chp 1'
alias pine='chp 2; ssh -Y cone@pine64'
alias cwweb='chp 5; pass -c noaa/cwweb; ssh cwweb.dmz; chp 1'
alias gl='chp 7; ssh -Y gl; chp 1'
alias hera='chp 5; ssh -X James.Kessler@hera-rsa.boulder.rdhpcellens.noaa.gov; chp 1'
alias jet='chp 5; ssh -X James.Kessler@jet-rsa.boulder.rdhpcs.noaa.gov; chp 1'
alias niag='chp 6; ssh -X James.Kessler@niagara-rsa.boulder.rdhpcs.noaa.gov; chp 1'
alias rh='chp 2; ssh -qY rhino; chp 1'
alias rhp='chp 3; ssh -qY rhino-pre; chp 1'
alias umich='pass -c noaa/umich; chp 7; ssh -X jamkessl@login.itd.umich.edu; chp 1'
alias wdev='chp 6; ssh -Y wwwdev; chp 1'
##alias umvpn='anyconnect-vpn connect umvpn.umnet.umich.edu/umvpn-split-tunnel-alt'
alias umvpn='vpn connect umvpn.umnet.umich.edu/umvpn-split-tunnel-alt'
alias gp='git add .; git commit -myea; git push'


export mycert='pkcs11:model=;manufacturer=;serial=;token=KESSLER.JAMES.ANDREW.1521470794;id=%00%01;object=PIV%20ID%20Certificate;type=cert'

# temporary
alias iv='cs ~/work/ice/ice_val'



# aliae
alias 2k='xrandr -s 2560x1440'
alias R='/bin/R -q --no-save'
alias aws='aws --no-sign-request'
alias dup='pwd | gnome-terminal && xdotool key super+bracketright'
alias brown='play -qn synth brownnoise'
alias mouse='echo connect "34:88:5D:B5:EA:E3" | bluetoothctl; sleep 3; scrfix'
alias mouse2='echo connect "34:88:5D:B5:B2:A7" | bluetoothctl; sleep 3; scrfix'
alias mouse3='echo connect "F4:73:35:5B:99:28" | bluetoothctl; sleep 3; scrfix'
alias bat='upower --dump /org/freedesktop/UPower/devices/battery_BAT0 | grep -m1 -A1 "time to empty"'
alias bt_reset='sudo modprobe -rv btusb; sleep 1; sudo modprobe -v btusb'
alias cp='cp -i'
alias cfs='cs ~/work/fvcom/glcfs'
alias CC='cs ~/work/coastal_coupling'
alias cl='echo call/text: TW0 F0UR E!GHT 8.2.0. - l243 | xclip -i'
alias cpwd='pwd | tr -d "\n" | xclip -i'
alias detach='/bin/wmctrl -r :SELECT: -b add,skip_taskbar'
alias retach='/bin/wmctrl -r :SELECT: -b remove,skip_taskbar'
alias pin='/bin/wmctrl -r :SELECT: -b add,above'
alias unpin='/bin/wmctrl -r :SELECT: -b remove,above'
alias figlet='figlet -d $HOME/.local/share/fonts'
alias fnlock='echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode'
alias fnoff='echo 1 | sudo tee /sys/module/hid_apple/parameters/fnmode'
alias showfigfonts='showfigfonts -d $HOME/.local/share/fonts'
alias ext='xrandr --output eDP-1 --off' # turn builtin display off
alias int='xrandr --output eDP-1 --auto'  # turn builtin display o
alias python='python3'
#alias editemo='vi ~/.linuxbrew/lib/python3.7/site-packages/hangups/ui/emoticon.py'
#alias feh='feh -Z -x -g +1000+500'
alias feh='feh -. -x -g -1+1'
alias gshare='gdrive upload -p 1psAdw_Vng4BcTwtF_Ewd4tJOZtwxkwzI'
#alias gimp='flatpak run org.gimp.GIMP//stable'
#alias gimp='flatpak run org.gimp.GIMP'
alias hd='xrandr -s 1920x1080'
alias l.='ls -d .*'
alias less='less -i'
#alias lk='feh -F /home/kessler/pics/personal/roobiestwobie/png/IMG_3910.png'
alias lk='feh -F /home/kessler/images/us_lock_screen.png'
#alias lks='mupdf-x11 $HOME/docs/reference/quick/14500.pdf'
alias lo='libreoffice'
alias ll='ls -lh'
alias logls='v4l2-ctl -d /dev/video2 -C focus_auto,focus_absolute,exposure_auto'
alias lp='lp -o sides=two-sided-long-edge'
alias lp1='\lp'
alias lp_draft='lp -o sides=two-sided-long-edge -o ColorModel=KGray -o OutputMode=FastDraft'
alias ls='ls --color'
alias lsnew="find ~/Downloads/ -mtime -1 -iname '*mp4' "
alias mirror='vlc --video-filter=transform --transform-type=hflip v4l2:///dev/video2'
alias mic='arecord -d 3 /tmp/tmp.wav; aplay /tmp/tmp.wav'
alias nau='nautilus'
alias mv='mv -i'
alias myxev='/bin/xev | sed -nr '\''s/.*keycode ([0-9]+) \S+ \S+ (\S+)\), .*/\1 \2/p'\'' '
alias notes='cs ~/docs/my_notes'
alias pdflatex='pdflatex -interaction nonstopmode'
alias pers='cs ~/personal'
alias pp='cs ~/docs/papers/'
alias pawd='cs `xclip -o`'
alias gslide="vivaldi --app='https://docs.google.com/presentation/u/1/'"
alias qgis='/var/lib/flatpak/exports/bin/org.qgis.qgis'
alias rm='rm -I'

alias pand='muzik pand'
alias spot='muzik spot'


alias pushpass='rsync -av /home/j4mes/.password-store  prec:/home/kessler/'
alias pullpass='rsync -av prec:/home/kessler/.password-store /home/j4mes/'


alias tpfix='pkill -e syndaemon; syndaemon -K -i 0.5 -R -d '


alias up='nmcli con up'
alias dn='nmcli con down'
alias vpns='nmcli con show --active'

alias wifis='nmcli device wifi list'
alias wofwon='nmcli radio wif off; sleep 1; nmcli radio wifi on'

alias rmind='nohup feh -. -x -g 150x150+0-1 ~/images/icons/reminder.png > /dev/null & sleep .5; wmctrl -r :ACTIVE: -b add,skip_taskbar'
alias rc='. ~/.bashrc'
#alias simple-scan='simple-scan hpaio:/net/ENVY_4520_series?ip=192.168.4.34'
alias traf='nohup google-chrome --app=http://maps.google.com/maps?layer=t'
alias vi='/usr/bin/vim'
alias ws='wmctrl -n'
alias wrk='cs ~/work'



#alias conv=sed -r "s/[A-Za-z]//g; s,\°,+,g; s,',/60+,g; s,\",/3600,g; s/,/;/g"  | R --slave
alias conv='sed -r "s/[A-Za-z]//g; s,\°,+,g; s,\x27,/60+,g; s,\x22,/3600,g; s/,/;/g" | R --slave'

# functions

mvcld(){
	scp $1 $APOLLO/tmp
	rm -v $1
}



locked_drags(){ 
	xinput;
	echo ' xinput set-prop $1 316 1'; 
	xinput set-prop $1 316 1 
} 


bak(){ cp -vL $1{,.bak}; }
clc(){  echo "$@" | R --slave --vanilla;  }
cs(){ builtin cd "$@" && ls; }
dmp(){ ncdump -h $1 | less; }
#pass () { DISPLAY=''; /usr/local/bin/pass "$@"; DISPLAY=':0'; }

#decll() { echo "$@" | sed -r "s/[A-Z,a-z]//g; s,\°,+,g; s,',/60+,g; s,\",/3600,g; s/,/;/g" | R; }


fvdts () { 
	fn=$1;
	dt=$2;
	itime=($(ncks -HCs '%i*3600*24\n' -d time,$dt -v Itime $fn | xargs -n1 | bc));
	itime2=($(ncks -HCs '%i/1000\n' -d time,$dt -v Itime2 $fn | xargs -n1 | bc));
	for i in ${!itime[@]};	do
		secs=$(( ${itime[i]} + ${itime2[i]} ));
		TZ='utc' date -d @$secs '+%Y-%m-%d %HZ';
	done
}


#mu(){ /usr/local/bin/mupdf-x11 "$@" & }
mu(){ /usr/bin/mupdf -C FFFFCC "$@" & } # open with "cream" as bg
#mugl(){ /usr/local/bin/mupdf-gl -C FFFFCC "$@" & } # open with "cream" as bg

# print unix epoch from netcdfs in various units
secs(){	ncks -HCs '%f\n'            -d time,"$2" -v time $1 | bc | xargs -iz date -u -d +@z '+%Y-%m-%d %H:%M:%S'; }
mins(){	ncks -HCs '60*%f\n'         -d time,"$2" -v time $1 | bc | xargs -iz date -u -d +@z '+%Y-%m-%d %H:%M:%S'; }
hrs(){	ncks -HCs '3600*%f\n '      -d time,"$2" -v time $1 | bc | xargs -iz date -u -d +@z '+%Y-%m-%d %H:%M:%S'; }
days(){	ncks -HCs '24*3600*%f\n'    -d time,"$2" -v time $1 | bc | xargs -iz date -u -d +@z '+%Y-%m-%d %H:%M:%S'; }

logctl(){
	v4l2-ctl -d /dev/video2 -c exposure_auto=3 
	v4l2-ctl -d /dev/video2 -c focus_auto=0 
	v4l2-ctl -d /dev/video2 -c focus_absolute=$1 

}
space2_(){  sed -r 's/ /_/g; s/-/_/g; s/_+/_/g' <<< "$@" | xargs mv -v "$@";}

tex2pdf() { 
# pass the first arg to entr           compile it                    send SIGHUP so mudpf refreshes
	ls $1 | entr /bin/bash -c "pdflatex -interaction nonstopmode $1 && pkill -HUP mupdf" \
	| grep '!' && feh -. -x -g 100x100+1 $HOME/pics/icons/skull.png
	# use your ~/my_scripts/tex.sh with entr instead
}	# grep for errors and flash skull as needed


colors(){  
	eval $(echo "no:global default;fi:normal file;di:directory;ln:symbolic link;pi:named pipe;so:socket;do:door;bd:block device;cd:character device;
	or:orphan symlink;mi:missing file;su:set uid;sg:set gid;tw:sticky other writable;ow:other writable;	st:sticky;ex:executable;"|sed -e 's/:/="/g; s/\;/"\n/g')           
	{      
		IFS=:     
		for i in $LS_COLORS; do        
		echo -e "\e[${i#*=}m$( x=${i%=*}; [ "${!x}" ] && echo "${!x}" || echo "$x" )\e[m" 
		done       
	} 
}


addUHD(){ 
	xrandr --newmode "UHD" 311.83  2560 2744 3024 3488  1440 1441 1444 1490  -HSync +Vsync
	xrandr --addmode DP-1 "UHD"
}




bigger(){
	xrandr newmode "1280x720" 74.48  1280 1336 1472 1664  720 721 724 746  -HSync +Vsync
	xrandr --addmode eDP-1 1280x720
	xrandr -s 1280x720
}

scrfix(){
	ids=$(xinput | egrep -i 'mouse|logitech' | grep -Eo 'id=[0-9]+' | grep -Eo '[0-9]+')
	for id in $ids; do xinput set-prop $id 'Evdev Scrolling Distance' -1 1 1; done
}

gmap(){ opera "https://www.google.com/maps/search/?api=1&query=$@"& }

alias audef='pactl set-default-sink $(pactl list short sinks | grep bluez | cut -f1)'


 # bluetooth ctl stuff
export bt_rukus=00:18:16:11:28:4B
export bt_redbolt=00:00:AB:CD:37:59
export bt_keybrd=C0:A5:3E:0B:DA:D3
export bt_blkbolt=00:00:AB:CD:F2:DE
export bt_grybolt=20:04:14:20:48:4A
export bt_wraith=E9:08:EF:2B:47:93
export bt_krc=00:12:01:48:70:33

																
btl () { 
	echo currently connected:;
	echo devices | bluetoothctl | grep -v '\[' | cut -d' ' -f2 | while read uuid; do
	echo "info $uuid" | bluetoothctl | grep -q 'Connected: yes' && echo "info $uuid" | bluetoothctl | grep Name | sed -r 's/^\s+Name: / - /g';
	done
}

function btc(){ echo connect $1 | bluetoothctl; sleep 2 | bluetoothctl; }
function btp(){ echo pair $1 | bluetoothctl; sleep 8 | bluetoothctl; }


alias clcp='echo -e "call/text:\ntw0.f0ur.e!ght 820 on3 tw0 four thr33" | xclip -i'


# debugging timezone stuff
#setfont sun12x22
#c1=$(p11tool --list-all-certs 2> /dev/null | tail -n1 | awk '{print $3}')
#url=$(p11tool --list-all-certs $c1 2> /dev/null | grep -A1 'Object 3' | tail -n1  | awk '{print $2}')
