#!/bin/dash

# Get the courses which a student is enrolled in
acc zXXXXXXX | # Replace with the zID of the student
sed -n '/User classes/,/Misc classes/p' |
head -n -1 | # Removes the `Misc classes :` line
cut -d':' -f2 | # Get the info on the RHS
tr ', ' '\n' | # Separates each class onto its own new line
grep -E 't2_Student' | # Get the ones the user is student of
sed -E 's/t2.*$//' # Takes only the course name