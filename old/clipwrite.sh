#!/bin/bash

title=$(xdotool getwindowfocus getwindowname | cut -d. -f1)

timeout .5 feh -. -x -g 100x100+1 ~/pics/icons/stabbed-note.png

outfile=/home/kessler/docs/papers/notes/${title}.txt

xclip -o >> $outfile
echo -e '\n \n  ===================================================================== \n' >> $outfile
