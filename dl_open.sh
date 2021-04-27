#!/bin/bash
while [ -f /home/kessler/Downloads/*opdownload ]; do sleep .1; done

# check for new pdfs and open with mupdf
find /home/kessler/Downloads/ -mmin -.1 -type f -iname '*.pdf'  |  xargs -r -n1 -P10 -iz /usr/local/bin/mupdf-x11 -C FFFFCC "z"

# check for new image files and open with feh
find /home/kessler/Downloads/ -mmin -.1 -type f -regextype egrep -regex '.*.png|.*.jpg|.*.gif'   | xargs -r -iz /usr/local/bin/feh -Z -x -g +1000+500 "z"


# old method (not even sure if it worked)
#source ~/.scriptsrc
#[[ -z `find ~/Downloads/ -mmin -.01 -iname '*.pdf' -type f` ]] && exit 0
#ls -1rt ~/Downloads/*.pdf | tail -n1 | xargs -iz mupdf-gl "z"
#ls -1rt ~/Downloads/*.pdf | tail -n1 | xargs -iz mupdf-x11 -r 120 -C FFFDD0 "z"
