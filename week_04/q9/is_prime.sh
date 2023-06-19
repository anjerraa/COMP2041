#!/bin/dash

: '
Test whether the specified integer is prime

Pseudocode:

```
INPUT n

IF n == 1
    echo "number is not prime"
    exit 1

i = 2
WHILE i <= n / 2
    IF n % i is not equal to 0
        i = i + 1
    ELSE
        echo "number is not prime"
        exit 1

echo "number is prime"
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

if [ "$1" -eq 1 ];
then
    echo "$1 is not prime"
    exit 1
fi

i=2
while [ "$i" -le $(($1 / 2)) ];
do
    if [ $(($1 % i)) -ne 0 ];
    then
        i=$((i + 1))
    else
        echo "$1 is not prime"
        exit 1
    fi
done

echo "$1 is prime"
exit 0
