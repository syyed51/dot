#!/bin/bash -vx

Path=./words.txt
while IFS= read -r varname; do
    echo "-----"
    say $varname
    echo "-----"
    printf '%s\n' "$varname"
done < "$Path"
