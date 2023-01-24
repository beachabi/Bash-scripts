# !/bin/bash


ram_total=$(free | grep -i mem | awk '{print $2}')
var=$(echo 'scale=3; '$ram_total'/1000000' | bc -l)
#echo $var
if [[ $ram_total/1000000 -le "0" ]]; then
	echo "0"$var' GB'
else
	echo $var' GB'
fi
