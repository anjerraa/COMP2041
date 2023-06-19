#!/bin/dash

# note you can only run this in the cse server due to the
# `mlalias` command

mlalias cs2041.23T2.tutors |
sed -n '/Addresses:/,/Owners:/p' |
head -n -1 | # Removes the last line
tail -n +2 | # Removes the first line
sed -E 's/^\s*//;s/\s*$//' | # Removes starting/trailing spaces
grep -E '^z' # Gets the lines starting with `z`