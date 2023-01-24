#!/bin/bash

dir=$(dirname $0)

source $dir/corrrect.sh



if [[ $1 -eq 1 && $# -eq 1 ]]; then
	
	echo "LETS GO"
	read -p "Enter path to log: " log_path	
	while read line 
	do
		echo $(echo $line | sed s/",.*"//) 

	done < log_path

fi




if [[ $1 -eq 2 && $# -eq 5 ]];
then
	find ~ -newerct "$2 $3" ! -newerct "$4 $5" -exec rm -rf {} \;

elif [[ $1 -eq 2 && $# -eq 1 ]];
then
	find ~ -newerct "$yyyy1" ! -newerct "$yyyy2" -exec rm -rf {} \;

fi



if [[ $1 -eq 3 && $# -eq 1 ]];
then	
	echo "LETS GO"
	read -p "Enter name to find: " name
	#echo $name
	find ~ -name "$name" -exec rm -rf {} \;
fi
