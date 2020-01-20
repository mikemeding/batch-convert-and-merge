#!/bin/bash
echo "building filename.txt from: $1"
rm -f filenames.txt # remove existing filenames.txt if it exists
rm -rf $1/__MACOSX # remove __MACOSX archive folder if it exists
find $1 -name ".*" -exec rm -fv {} \; # remove dot files
find $1 -path ./__MACOSX -prune -o -name \*1.tif -type f > filenames.txt
find $1 -path ./__MACOSX -prune -o -name \*3.tif -type f >> filenames.txt
