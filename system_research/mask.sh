# !/bin/bash

all_mask=$(netstat -rn | grep 255 | awk '{print $3}')
echo $all_mask | awk '{print $1}'
