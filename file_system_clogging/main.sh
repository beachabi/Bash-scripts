#!/bin/bash

START_TIME=$(date +%s%2N)
STIME=$(date +%H:%m' '%d.%m.%y)


dir=$(dirname $0)


source $dir/correct.sh


ddmmyy=$(date +_%d%m%y)

# path=$(echo $1 | sed s/"\/"*$//)
# num_folds=$2
# num_files=$4

type_files=.$(echo $2 | sed s/".*\."//)



full_file_size=$3
file_size=$check_arg_6_num



letters+=($(echo $1 | grep -o .))
letters_files+=($(echo $2 | sed s/"\..*"// | grep -o .))



	
path_list+=($(sudo find ~/ -type d -user $(whoami) -perm /u=w 2>/dev/null | grep -v linux ))



shuf_list+=($(shuf -i 1-${#path_list[*]} -n$(shuf -i 1-10 -n1) ))




#for i in ${path_list[@]};
#do
#echo $i
#done

#exit

# echo $shuf_num 

#for i in ${path_list[@]};
#do
#echo $i
#done

# exit

# num_files=$(shuf -i 1-20 -n1)
# echo $num_files
# exit

source $dir/force.sh
take_path

for (( make_num=1; make_num<$(shuf -i 1-100 -n1); make_num++))
do
	source $dir/main.sh
done

#echo create total folders: $count
#echo total files: $count_files


END_TIME=$(date +%s%2N)
echo "START_TIME $STIME, END_TIME $(date +%H:%m' '%d.%m.%y), WORK_TIME $(echo "scale=2; ($END_TIME - $START_TIME) / 100" | bc)" 
echo "START_TIME $STIME, END_TIME $(date +%H:%m' '%d.%m.%y), WORK_TIME $(echo "scale=2; ($END_TIME - $START_TIME) / 100" | bc)" >> log 

