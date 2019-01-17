#!/bin/bash

input="$1"

touch $input
# convert to html (which cupsfilter can handle)
textutil -convert html -output "/Users/kessler/Downloads/temp.html" $input

sleep 1 
new=${input%.*}.pdf  # set new name for pdf
echo $new
cupsfilter ~/Downloads/temp.html > "$new"
rm ~/Downloads/temp.html

