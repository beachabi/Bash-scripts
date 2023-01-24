# !/bin/bash


dir=$(dirname $0)

source $dir/check.sh




START_TIME=$(date +%s%2N)


echo "Total number of folders (including all nested ones) = $(find $1 -type d 2>/dev/null | wc | awk '{print $1}'))"

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
du -h -d 1 $1 2>/dev/null | sort -h -r | grep -v '/$' | sed s/'$'/'\/,'/g | grep -n / | sed s/:/' - '/ | awk 'NR<=5{a=$3; $3=$4; $4=a; print}'

echo "Total number of files = $(find $1 -type f 2>/dev/null | wc | awk '{print $1}')"

echo "Text files = $(find $1 -type f -name "*.txt" 2>/dev/null | wc | awk '{print $1}')"


echo "Executable files = $(find $1 -type f -name "*.exe" 2>/dev/null | wc | awk '{print $1}')"

echo "Log files = $(ls -la $1*.exe 2>/dev/null | wc | awk '{print $1}')"

echo "Archive files = $(find $1 -iname "*.zip" -o -iname "*.jar" -o -iname "*.7zp" 2>/dev/null | wc | awk '{print $1}')"

echo "Symbolic links = $(ls -laR $1  2>/dev/null | grep '^l' | wc | awk '{print $1}')"



source $dir/top10files_1.sh
source $dir/top10files_2.sh





END_TIME=$(date +%s%2N)


echo "Script execution time (in seconds) = $(echo "scale=2; ($END_TIME - $START_TIME) / 100" | bc)" 


