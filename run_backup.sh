#!/bin/bash
# this script backsup config files and scripts to github (hopefully)
# guessing i'll eventually setup cron to do this regularly

# set path of backup directory
bu_dir=$HOME/.backup/


# cp things to bu_dir/.config
cp -at ${bu_dir}/.config/ $HOME/.config/{autokey,dconf,feh,autostart,opera/Preferences}


