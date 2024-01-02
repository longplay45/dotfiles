#!/bin/bash

FILES="*.avi"

for if in $FILES
do
  /Applications/HandBrakeCLI -i "$if" -o "$if".mp4 --preset="Fast 720p30"
done
