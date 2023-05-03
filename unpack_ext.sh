#!/bin/bash

unzip $1 metadata.json
uuid=$(jq -r '.uuid' metadata.json && rm metadata.json)
mkdir $uuid
unzip $1 -d $uuid

rm $1
