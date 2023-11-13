#!/bin/bash

script_exo1=$(./exo1_script.sh "$1")

if [ $# -ge 2 ]; then
    mots=$2
else
    mots=25
fi
echo "$script_exo1" | awk '{ count[$1]++ } END { for (word in count) print word, count[word] }' | sort -k2 -nr | head -n "$mots"
