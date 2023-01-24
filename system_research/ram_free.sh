# !/bin/bash

ram_free=$(free | grep -i mem | awk '{print $4}')

var=$(echo 'scale=3; '$ram_free'/1000000' | bc -l)

if [[ $ram_free/1000000 -le "0" ]]; then
	echo "0"$var' GB'
else
	echo $var' GB'
fi
