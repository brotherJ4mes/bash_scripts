#!/bin/bash
while true; do find /home/kessler/Downloads/ | entr -pd /home/kessler/my_scripts/dl_open.sh; done

