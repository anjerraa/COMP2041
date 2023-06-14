#!/bin/sh

while read id mark _;
do
    if [ "$mark" -eq "$mark" ] 2> /dev/null && 
    [ "$mark" -ge 0 ] && 
    [ "$mark" -le 100 ]; 
    then
        if [ "$mark" -lt 0 ];
        then
            echo "$id FL"
        elif [ "$mark" -lt 65 ];
        then
            echo "$id PS"
        elif [ "$mark" -lt 75 ];
        then
            echo "$id CR"
        elif [ "$mark" -lt 85 ];
        then
            echo "$id DS"
        elif [ "$mark" -le 100 ];
        then
            echo "$id HD"
        fi
    else
        echo "$id ?? ($mark)"
    fi
done