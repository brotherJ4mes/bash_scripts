#!/bin/bash
. ~/.scriptsrc

# get highlighted string from clip board
hl_str=$(xclip -o) 

# determine if string is a url or search phrase
echo $hl_str | grep -Ei 'http|\.gov|\.com|\.org|\.net' 

if [ $? -eq 1 ]; then
	echo google searching...
	srch=$(echo $hl_str | sed -r 's/\s+/\+/g')
	echo $srch
	opera duckduckgo.com/?q=$srch
else
	echo going directly to url...
	opera $hl_str
fi


# old working
#str=$(xclip -o | sed -r 's/\s+/\+/g')
#opera google.com/search?q=$str

