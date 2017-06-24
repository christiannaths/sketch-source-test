#!/bin/bash

###
# Requires Git v2.10.2
###

echo "Packing Sketch sources"

REPO_ROOT=$(git rev-parse --show-toplevel)

find $REPO_ROOT -name "*.sketch" | while read fname; do
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