#!/bin/sh
# Love doesn't like symlinks! Oh noes!
SRC="src"

GIT=`git log --pretty=format:'%h' -n 1`
GIT_COUNT=`git log --pretty=format:'' | wc -l`

echo "git,git_count = '${GIT}','${GIT_COUNT}'" > $SRC/git.lua

# *.love
cd $SRC
zip -r ../_temp.love * > /dev/null
cd ..
love _temp.love
# If this script gets slow, research how to get the zip to update instead of rebuilding. - textmode and bartbes
rm _temp.love

