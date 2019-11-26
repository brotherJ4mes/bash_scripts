#!/bin/bash

source ~/.scriptsrc
[[ -z `find ~/Downloads/ -mmin -.01 -iname '*.pdf' -type f` ]] && exit 0
ls -1rt ~/Downloads/*.pdf | tail -n1 | xargs -iz mupdf-x11 "z"

