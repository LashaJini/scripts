#!/usr/bin/bash

file=$1
log="$file.log"

if [[ $1 != "" ]]
then
  node --prof --no-logfile-per-isolate --log --logfile="$log" "$file" && node --prof-process "$log"> "$log.txt" && less "$log.txt" && rm "$log"
else
  echo "Usage: ./prof-node.sh <filename>"
fi

