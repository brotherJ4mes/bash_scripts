#!/bin/bash


#ls "$1" | entr /bin/bash -c "pdflatex -interaction nonstopmode $1 && pkill -HUP mupdf"

#ls "$1" | entr /bin/bash -c "pdflatex -interaction nonstopmode $1 && pkill -HUP mupdf | egrep '^Output written on' && $HOME/my_scripts/toast.sh checkered-flag.png"

# this works BUT you don't see any of the error output!
#ls "$1" | entr /bin/bash -c \
#	"pdflatex -interaction nonstopmode $1 | egrep '^Output written on' \
#	&& $HOME/my_scripts/toast.sh checkered-flag.png && pkill -HUP mupdf"

# best solution
ls "$1" | entr /bin/bash -c \
	"pdflatex -interaction nonstopmode $1 | tee /tmp/tex.log;
	egrep -q '^Output written on' /tmp/tex.log && timeout .5 /usr/local/bin/feh -. -x -g 150x150-1-1 ~/images/icons/checkered-flag.png
	pkill -HUP mupdf"





#pdflatex -interaction nonstopmode $1 #| grep '\!' && $HOME/my_scripts/toast.sh skull.png || $HOME/my_scripts/toast.sh check-mark.png
#pkill -HUP mupdf
#echo '======================================='
#echo '============ DONE ====================='
#echo '======================================='
