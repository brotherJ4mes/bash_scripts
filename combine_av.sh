#!/bin/bash

#ffmpeg -i $1 -i $2 -c copy -map 0 -map 1:a:0 $3
#echo combined video from $1 with audio from $2:   saved as $3

vid_fn=${1}.mp4
aud_fn=${1}_a.mp4
out_fn=../$1.mp4


ffmpeg -i $vid_fn -i $aud_fn -c copy -map 0 -map 1:a:0 $out_fn
echo combined video from $vid_fn with audio from $aud_fn:   saved as $out_fn

