#!/bin/bash

###
# Requires Git v2.10.2
###

echo "Extracting Sketch files"

DIR=$(git rev-parse --show-toplevel)

thing() {
  echo $1
}

# find $DIR -name '*.sketch' -exec echo "{}" \;

find $DIR -name "*.sketch" | while read fname; do
  if [ -f "${fname}" ] ; then
    mv "$fname" "$fname.tmp"
    unzip -o "$fname.tmp" -d "$fname/"
    rm "$fname.tmp"
  else
    echo "$fname is not a file";
  fi
  
done