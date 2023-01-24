#!/bin/bash

space=$(df / | awk 'NR==2{print $4}')

echo $space

while [[ $space -gt 1000000 ]]
do

space=$(( $space - 100 ))
    #echo (( $space - 100 )) )


(( count_space++ ))
echo $count_space

done

