#!/bin/bash


dir=$(dirname $0)


source $dir/correct.sh


ddmmyy=$(date +_%d%m%y)

path=$(echo $1 | sed s/"\/"*$//)
num_folds=$2
num_files=$4
type_files=.$(echo $5 | sed s/".*\."//)
full_file_size=$6

file_size=$check_arg_6_num


letters+=($(echo $3 | grep -o .))
letters_files+=($(echo $5 | sed s/"\..*"// | grep -o .))



source $dir/force.sh
print_1

echo create total folders: $count from ${letters[@]}
echo total files: $count_files


