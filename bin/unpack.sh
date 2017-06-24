#!/bin/bash

###
# Requires Git v2.10.2
###

echo "Extracting Sketch files"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT=$(git rev-parse --show-toplevel)

find $REPO_ROOT -name "*.sketch" | while read fname; do
  if [ -f "${fname}" ] ; then
    mv "$fname" "$fname.tmp"
    unzip -o "$fname.tmp" -d "$fname/"
    rm "$fname.tmp"

    find "$fname" -name "*.json" | while read jsonfname; do
      if [ -f "${jsonfname}" ] ; then
        echo "$jsonfname is a JSON file"
        touch "$jsonfname.tmp"
        cat "$jsonfname" | $DIR/jq . > "$jsonfname.tmp"
        mv "$jsonfname.tmp" "$jsonfname"
      else
        echo "$jsonfname is not a file" 
      fi
    done

  else
    echo "$fname is not a file";
  fi
  
done