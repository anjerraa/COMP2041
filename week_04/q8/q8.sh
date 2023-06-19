#!/bin/dash

# note you can only run this in the cse server due to the
# `members` and `acc` commands
# will run REALLY slowly because it has to process inputs
# on all of the students who are enrolled in COMP2041

(
    for zid in $(members COMP2041 | cut -d' ' -f1);
    do
        acc "z$zid" 2> /dev/null |
        sed -n '/User classes/,/Misc classes/p' |
        head -n -1 | # Removes the `Misc classes :` line
        cut -d':' -f2 | # Get the info on the RHS
        tr ', ' '\n' | # Separates each class onto its own new line
        grep -E 't2_Student' | # Get the ones the user is student of
        sed -E 's/t2.*$//' # Takes only the course name
    done
) |
sort |
uniq -c |
sort -nr