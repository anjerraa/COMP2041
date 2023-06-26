#!/bin/dash

top_and_bottom() {
    if [ ! -f "$1" ];
    then
        echo "$0: error: $1 is not a valid file"
        exit 1
    fi
    echo "====================="
    echo "Filename: $1"
    echo "---------------------"
    echo "First line:"
    head -n 1 "$1"
    echo "Last line:"
    tail -n 1 "$1"
    echo "====================="
}

for file in "$@";
do
    top_and_bottom "$file"
done