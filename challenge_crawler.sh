#!/bin/bash
echo 'Enter search term (case-sensitive):'
read searchterm
count=0
array=()
for file in *.txt
do
    while IFS= read -r line || [ -n "$line" ]
    do
        # printf '%s\n' "$line"
        if [[ $line == *$searchterm* ]]
        then
            ((count=count+1))
            array+=($file)
        fi
    done < $file
done


echo 
echo ===== Results =====
echo \"$searchterm\" returned $count times...
echo People who likes \"$searchterm\":
for i in ${array[@]}
do
    echo - $i
done
read
# Created by Dylan Tok 2101372