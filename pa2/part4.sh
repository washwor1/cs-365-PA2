#!/usr/bin/env bash
#basically used the "general strategy"
lines=()

for file in ./*.sample; do
  awk -F'[[:space:]:]+' '/^sequence position/ {number=$3} /^sequence data/ {string=$3; for (i=4; i<=NF; i++) string=string""$i; formatted=sprintf("%04d %s", number, string); print formatted}' "$file"
done |
sort -n |
cut -d ' ' -f 2 |
tr -d '\n' > sequence.txt


fold -w1 sequence.txt | awk '
  { count[toupper($0)]++ }
  END {
    print "A " count["A"]
    print "T " count["T"]
    print "C " count["C"]
    print "G " count["G"]
  }
' > pairs.txt

sequence=$(cat sequence.txt)

fold -w3 sequence.txt | awk '
  { count[$0]++ }
  END {
    for (codon in count) {
      printf "%s %.6f%%\n", codon, count[codon]/(length("'"$sequence"'")/3)*100
    }
  }
' | sort > codons.txt