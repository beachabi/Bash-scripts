# !/bin/bash

array_for_all=()
save_in_file=$(date +%d_%m_%Y_%H_%M_%S)'.status'

IFS=$'\n'

array_for_all+=($(echo HOSTNAME = $(hostname)))


array_for_all+=($(echo TIMEZONE = $(timedatectl | grep "Time zone" | awk '{print $3" UTC "$5}' | sed s/0/''/g | sed s/')'/''/g)))

array_for_all+=($(echo USER = $(whoami)))

array_for_all+=($(echo OS = $(cat /etc/issue)))

array_for_all+=($(echo DATE = $(date +%d' '%b' '%Y' '%H:%M:%S)))

array_for_all+=($(echo UPTIME = $(uptime | awk '{print $3}' | sed s/','/''/g)))



uptime=$(uptime -p)

IFS=$' ' read -r -a array <<< "$uptime"


for i in ${array[@]};
do
	count=$((count+1))
done

if [[ $count -gt "4" ]]; 
	then
		tosec=$((${array[1]}*60 + ${array[3]}))
		array_for_all+=($(echo UPTIME_SEC = $(($tosec*60))))
	else
		tosec=$(( ${array[1]}*60 ))
		array_for_all+=($(echo UPTIME_SEC = $(($tosec))))
fi

path=$(dirname $0)

array_for_all+=($(echo IP = $(source ${path}/ip.sh)))
array_for_all+=($(echo MASK = $(source ${path}/mask.sh)))
array_for_all+=($(echo GATEWAY = $(source ${path}/gateway.sh)))
array_for_all+=($(echo RAM_TOTAL = $(source ${path}/ram_total.sh)))

array_for_all+=($(echo RAM_USED = $(source ${path}/ram_used.sh)))

array_for_all+=($(echo RAM_FREE = $(source ${path}/ram_free.sh)))

array_for_all+=($(echo SPACE_ROOT = $(source ${path}/space_root.sh)))
array_for_all+=($(echo SPACE_ROOT_USED = $(source ${path}/space_root_used.sh)))
array_for_all+=($(echo SPACE_ROOT_FREE = $(source ${path}/space_root_free.sh)))




for line in ${array_for_all[@]};
do
	echo $line
done


read -p 'Do you want to save this in file? [y, n]: ' uns



if [[ $uns == "y" || $uns == "Y" ]]; 
	then
		for line in ${array_for_all[@]};
		do
			echo $line >> $save_in_file
		done
	
	else
		echo BYE BYE

fi
