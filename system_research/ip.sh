# !/bin/bash

#$(IFS=$'\n' read -r -a array <<< $(ip a | grep "inet "))
#echo ${array[0]}
IFS=$'\n'
for i in $(ip a | grep "inet ")
do
	read -a array <<< $i
done
echo ${array[0]} | awk '{print $2}'


