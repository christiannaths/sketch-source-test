#!/bin/bash

###
# Requires Git v2.10.2
###

echo "Packing Sketch sources"

DIR=$(git rev-parse --show-toplevel)

thing() {
  echo $1
}

# find $DIR -name '*.sketch' -exec echo "{}" \;

find $DIR -name "*.sketch" | while read fname; do
  if [ -d "${fname}" ] ; then
    FILENAME=$(basename $fname)
    mv "$fname" "$fname.tmp"
    cd "$fname.tmp"
    zip "$FILENAME" -r .
    mv $FILENAME ../$FILENAME
    rm -fr "$fname.tmp"
  else
    echo "$fname is not a directory";
  fi
done