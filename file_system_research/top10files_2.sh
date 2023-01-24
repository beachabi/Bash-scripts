# !/dev/null

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"

array_hash=()

for i in $(find $1 -type f -exec du -h {} \; 2>/dev/null | sort -h -r | awk 'NR<=10 {printf"%s - %s\n ", NR, $0}' | sed s/'^ '/''/ | awk '{print $1" "$2" "$4" "$3" "}' | awk '{print $3}');
do
	array_hash+=($(md5sum $i | awk '{print $1}'))
done



n2=$(find $1 -type f -exec du -h {} \; 2>/dev/null | sort -h -r | awk 'NR<=10 {printf"%s - %s\n ", NR, $0}' | sed s/'^ '/''/ | awk '{print $1" "$2" "$4" "$3" "}' | awk '{print $3}' | sed s/\.[^\.]*// | sed s/'^\.'/''/)


#array=()

array2=()

#for i in $n2;
#do
#	array+=($i)
#done


#IFS=$'\n'
for i in $(find $1 -type f -exec du -h {} \; 2>/dev/null | sort -h -r | awk 'NR<=10 {printf"%s - %s\n ", NR, $0}' | sed s/'^ '/''/ | awk '{print $1" "$2" "$4", "$3","}');
do
	array2+=($i)
done


for (( i = 0; i<10; i++ )) {
echo ${array2[$i]}" "${array_hash[$i]}
}




