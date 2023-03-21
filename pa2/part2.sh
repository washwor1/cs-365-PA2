#!/usr/bin/env bash
sorted=$(cut -d',' -f1,6 ./cars.csv | sort -t',' -k2nr)
highest=$(echo "$sorted" | head -n1 )
echo "$highest" | cut -d',' -f1,2 --output-delimiter=' ' > answer.txt
