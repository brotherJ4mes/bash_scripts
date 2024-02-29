#!/bin/bash

input=$(cat)
ins=$(echo "$input" | grep -ci 'in')
outs=$(echo "$input" | grep -ci 'out')
printf 'in|out \n%2i|%3i\n', $ins $outs
