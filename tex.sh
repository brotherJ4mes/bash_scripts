#!/bin/bash

pdflatex -interaction nonstopmode $1 | grep '\!' && $HOME/my_scripts/toast.sh skull.png
pkill -HUP mupdf
echo '======================================='
echo '============ DONE ====================='
echo '======================================='
