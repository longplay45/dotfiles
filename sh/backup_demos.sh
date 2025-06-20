#!/bin/bash

echo "Demos synchronisieren..."

rsync -av --include='*.mp3' --exclude='*' /Volumes/DATA2/Docs/Bitwig/Z_Mixdowns/ /Users/i/Docs/Cloud/lp45.audio/demos/

rsync -av --include='*' /Volumes/DATA2/Docs/Bitwig/ /Volumes/DATA3/Backup/Bitwig/

echo "Fertig!"