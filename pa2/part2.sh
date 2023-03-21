#!/usr/bin/env bash
# I decided to sort the csv and take the top value because it was simpler to implement.
# The iterative approach would probably be faster, but it wasn't required so I did it this way.
sorted=$(cut -d',' -f1,6 ./cars.csv | sort -t',' -k2nr)
highest=$(echo "$sorted" | head -n1 )
echo "$highest" | cut -d',' -f1,2 --output-delimiter=' ' > answer.txt
