#!/bin/sh

start=""
increment=""
stop=""

if [ $# -eq 1 ];
then
    start=1
    increment=1
    stop="$1"
elif [ $# -eq 2 ];
then
    start="$1"
    increment=1
    stop="$2"
elif [ $# -eq 3 ];
then
    start="$1"
    increment="$2"
    stop="$3"
else
    echo "Usage: $0 [FIRST [INCREMENT]] LAST" >& 2
    exit 1
fi

# What other error cases can we check for?
# 1. Any of the given value is not an integer
# 2. Incremental value is less than or equal to 0
# 3. Stop value is not greater than start value

current=$start
while [ "$current" -le "$stop" ];
do
    echo "$current"
    current=$((current + increment))
done