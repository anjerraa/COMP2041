#!/bin/dash

: '
Print the prime numbers less than the specified argument

Pseudocode:

```
INPUT n

i = 2
WHILE i <= n
    IF ./is_prime.sh i
        echo i
    i += 1
```
'

# check there is 1 argument
if [ "$#" -ne 1 ];
then
    echo "$0: usage: [number]"
    exit 1
fi

# check it is a number
if ! [ "$1" -eq "$1" ] 2> /dev/null;
then
    echo "$0: usage: [number]"
    exit 1
fi

# might need to do more error checking...

i=2
while [ "$i" -le "$1" ];
do
    if ./is_prime.sh "$i" > /dev/null;
    then
        echo "$i"
    fi
    i=$((i + 1))
done

