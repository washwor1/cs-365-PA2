#!/bin/bash
# pretty much just followed the "general strategy" using awk.
for file in *.txt
do
  filename=$(basename "$file")
  filename="${filename%.*}"
  mkdir "./$filename"
  while read -r line || [[ -n "$line" ]]
  do

    parameter=$(echo "$line" | awk '{print $1}')
    value=$(echo "$line" | awk '{print $2}')

    echo "$value" > "$filename/$parameter.txt"
  done < "$file"


  rm "$filename.txt"
done