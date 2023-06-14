#!/bin/sh

# First way - using two seds
# for file in *.c;
# do
#     echo "$file includes:"
#     cat $file |
#     grep -E '^#include' |
#     sed -E 's/[">][^">]*$//' |
#     sed -E 's/^.*["<]/    /'
# done

# Second way - using one sed with capture group
for file in *.c
do
    echo "$file includes:"
    cat $file | 
    grep -E "#include" |
    sed -E "s/^.*[<\"](.*)[>\"].*$/    \1/"
done