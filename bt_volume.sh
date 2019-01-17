#!/bin/bash

idx=$(pactl list sinks | grep -E '^Sink' | grep -Eo '[1-9][0-9]?')

echo $idx
echo $1


[[ "$1" == "up" ]] && pactl set-sink-volume $idx +3%
[[ "$1" == "down" ]] && pactl set-sink-volume $idx -3%
[[ "$1" == "mute" ]] && pactl set-sink-mute $idx toggle
