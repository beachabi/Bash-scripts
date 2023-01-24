#!/bin/bash

if [[ $# -ne 6 ]];
then
    echo "Wrong numbers of arguments (should be 6)"
    exit
fi

if [[ $2 =~ [^0-9] ]];
then
    echo "wrong ARG 2 - should be numbers"
    flag_check_exit=1
    #exit
fi


check_arg_3=$(echo $3 | grep -E "(^[a-Z]{1,7}$)")
check_arg_3_rep=$(echo $3 | grep -Eo "(.)\1")
if [[ $3 != $check_arg_3 || "" != $check_arg_3_rep ]];
then
    echo "wrong ARG 3 - you should use: from 1-7 different letters in string"
    flag_check_exit=1
    #exit
fi


if [[ $4 =~ [^0-9] ]];
then
    echo "wrong ARG 4 - should be numbers"
    flag_check_exit=1
    #exit
fi




check_arg_5=$(echo $5 | grep -E  "^[a-Z]{1,7}\.[a-Z]{1,3}$")

if [[ $5 != $check_arg_5 || "" != $(echo $5 | sed s/"\..*"// | grep -Eo "(.)\1") ]];
then
    echo "wrong ARG 5 - you should use: from 1-7 different letters before "." and 1-3 after"
    flag_check_exit=1
    #exit
fi





check_arg_6_num=$(echo $6 | grep -o "^[0-9]*kb$" | sed s/"^[0]*"// | grep -o "^[0-9]*")



if [[ $check_arg_6_num -gt 100 || $check_arg_6_num -le 0  ]]; 
then
    echo "wrong ARG 6 - you sould use correct size (from 0-100kb)"
    flag_check_exit=1
fi



if [[ $flag_check_exit -eq 1 ]];
then
    exit
fi