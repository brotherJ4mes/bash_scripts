#!/bin/bash

source ~/.scriptsrc

winttl=$(xdotool getactivewindow getwindowname)

fn=$(echo $winttl | cut -d\  -f1)
pg=$(echo $winttl | cut -d\  -f3 | cut -d/ -f1)

# do checks to avoid calling this by accident
if [[ $fn != *pdf || $pg != +([0-9]) ]]; then
	echo fn or pg is wrong
	/home/kessler/my_scripts/toast.sh skull.png .5
	exit
fi


cd $HOME/docs/papers/

while getopts "ypur" OPTION; do
	case $OPTION in
		y) echo "yellow color set"
		col=(1,1,0)
		;;
		
		p) echo "pink color set"
		col=(1.000,0.412,0.706)
		;;

		u) echo "undoing..."
		cp -f .undo/$fn .
		pkill -HUP mupdf
		exit
		;;

		r) echo "reverting..."
		cp -f .orig/$fn .
		pkill -HUP mupdf	
		exit
		;;
	esac
done

#backup if necessary
[[ -e .orig/$fn ]] || cp $fn .orig/${fn} && echo 'backing up file'

# do highlighting 
#str=$(xclip -o | tr '\n' ' ' | sed -r 's/- /-/g') # capture highlighted text (replace \n with space except for hyphens)
str=$(xclip -o | tr '\n' ' ') # capture highlighted text (replace \n with space except for hyphens)
# save highlighted text to notes folder
echo $str >> notes/${fn%%.pdf}.txt
python3 $HOME/my_scripts/highlight.py $fn $pg $col "$str" # use PyMuPDF to highlight

/home/kessler/my_scripts/toast.sh paint-brush.png .5
