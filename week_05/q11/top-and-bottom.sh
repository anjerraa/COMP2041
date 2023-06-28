#!/bin/dash

for file in "$@";
do
    top_and_bottom "$file"
done

top_and_bottom() {
    if ! [ -f "$1" ];
    then
        echo "$0: error: $1 is not a valid file" >&2
        exit 1
    fi
    echo "==========================="
    echo "File: $1"
    echo "---------------------------"
    echo "First line:"
    sed -n '1p' "$1"
    echo "Last line:"
    sed -n '$p' "$1"
    echo "==========================="
}