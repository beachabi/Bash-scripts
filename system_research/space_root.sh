# !/bin/bash

root_space=$(df / | awk 'NR==2{print $2}')

var=$(echo 'scale=2; '$root_space'/1000' | bc -l)

if [[ $root_space/1000 -le "0" ]]; then
	echo "0"$var' MB'
else
	echo $var' MB'
fi
