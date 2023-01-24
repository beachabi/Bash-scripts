# !/bin/bash

ram_used=$(free | grep -i mem | awk '{print $3}')


var=$(echo 'scale=3; '$ram_used'/1000000' | bc -l)
#echo $var
if [[ $ram_used/1000000 -le "0" ]]; then
	echo "0"$var' GB'
else
	echo $var' GB'
fi
