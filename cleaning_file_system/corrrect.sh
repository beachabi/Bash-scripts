#!/bin/bash





if [[ $# -eq 0 ]];
then 
	echo No mode for work
	exit
fi






if [[ $1 -eq 2 && $# -eq 1 ]];
then
	
	read -p "Enter first time in format - yyyy-mm-dd hh:mm   " yyyy1
	read -p "Enter first time in format - yyyy-mm-dd hh:mm   " yyyy2
		
fi



#
#if [[ $1 -eq 2 && $2 =~ ^([0-9]{4})-([0-9]{2})-([0-9]{2})$ && $3 =~ ^([0-9]{2}):([0-9]{2})$ && $4 =~ ^([0-9]{4})-([0-9]{2})-([0-9]{2})$ && $5 =~ ^([0-9]{2}):([0-9]{2})$ ]];
#then
#	check=1
#else
#	echo Wrong format of time - use yyyy-mm-dd hh:mm yyyy-mm-dd hh:mm
#fi
#
	
