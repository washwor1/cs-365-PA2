#!/usr/bin/env bash
# awk is op
# did the same thing as part2, but used awk.
# I did the iterative approach here because it made more sense
awk -F ',' 'BEGIN {max_hp=0;} NR>1 {if($6>max_hp){max_hp=$6; make=$1}} END {printf "%s %.6f\n", make, max_hp > "answer.txt"}' cars.csv
