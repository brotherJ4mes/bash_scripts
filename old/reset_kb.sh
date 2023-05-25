#!/bin/bash

source ~/.scriptsrc # load paths

toast.sh reset.png .75
pkill autokey 
pkill xbindkeys
#/bin/autokey-gtk & #> /dev/null & 
xbindkeys
