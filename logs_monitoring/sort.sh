#!/bin/bush



for line in $(ls $dir/../04/ | grep nginx_log)
do
	all_logs+=($dir/../04/$line)
done



if [[ $1 -eq 1 ]];
then
	awk '{print $0|"sort -k2"}' ${all_logs[@]}
fi



if [[ $1 -eq 2 ]];
then
	awk '{print $0|"sort -k1"}' ${all_logs[@]} | awk '{if ($1 != prev) print $0, prev=$1}'
fi



if [[ $1 -eq 3 ]];
then
	awk '$2 ~ /^[45]..$/ {print $0|"sort -k2"}' ${all_logs[@]}
 
fi



if [[ $1 -eq 4 ]];
then
	awk '$2 ~ /^[45]..$/ {print $0|"sort -k2"}' ${all_logs[@]} | awk '{if ($1 != prev) print $0, prev=$1}'
 
fi
