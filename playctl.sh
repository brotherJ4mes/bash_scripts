#!/bin/bash

export LD_LIBRARY_PATH=/usr/local/lib64; 
/usr/local/bin/playerctl -a $1
