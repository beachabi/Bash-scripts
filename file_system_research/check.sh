# !/bin/bash

if [[ $# -ne "1" ]]; then
	echo "You can put only 1 way"
	exit
fi




if [[ $1 =~ [^/]$ ]]; then
	echo "You have to put / in the end"
	exit
fi



if [[ -d $1 ]]; then
	go="go"
else
	echo "Dir does not exist"
	exit
fi


