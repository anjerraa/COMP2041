#!/bin/dash

print_message() {
    if [ "$#" -eq 1 ];
    then
        echo "$0: warning: $1"
    elif [ "$#" -eq 2 ];
    then
        echo "$0: error: $2"
        exit "$1"
    fi
}

# If there is one argument, print it as a warning
echo "This will print a warning"
print_message "This is a warning"

# If given two arguments, the first one is the exit code
# and the second one is the message
echo "This will print an error"
print_message 1 "This is an error"