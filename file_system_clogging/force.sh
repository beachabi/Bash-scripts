#!/bin/bash


#source $dir/force.sh
source $dir/force_1.sh


count=0


one=''
two=''
three=''
four=''
five=''
six=''
seven=''




check_count () {

	if [[ $count -eq $num ]];
	then
		break
	fi

}






make_directory () {

			check_space
			
			echo_dir=$(echo $mdir, $(echo $ddmmyy | sed s/"^_"//))
			
			
			mkdir -p $mdir 2>/dev/null 
			if [[ $? -eq 0 ]]; 
			then	
				echo $echo_dir
				echo $echo_dir 1>>log 
			
			#	mkdir -p $mdir 

				(( count++ ))
				init_files
				print_files_1
			else
				(( count ++ ))
			fi

}






take_path () {


for mdir_num in ${shuf_list[@]}
do
       	echo -------------creating new folder----------------	
#echo $count
#echo $num
	path=${path_list[$mdir_num]} 
	   #num_files=$(shuf -i 1-10 -n1)
	num=$(shuf -i 1-100 -n1)
	count=0
	print_1

done

}















print_1 () {



	for (( i=1; i<= $((100 - ${#letters[*]} + 1)); i++ ))
	do	

		if [[ $count -eq $num ]];
		then
			break
		fi
				

		one+=${letters[0]}

		if [[ ${#letters[*]} -eq 1  ]];
		then

			if [[ ${#one} -le 4 ]];
			then 

			continue
			fi

		

			mdir=$path/$one$ddmmyy
			make_directory

			continue
	
		else

		two=''
		print_2
		fi
	done

}





print_2 () {

	for (( j=1; j<= $((100 - $i )); j++ ))
	do
		
		if [[ $count -eq $num ]];
		then
			break
		fi

		two+=${letters[1]}
	

		if [[ ${#letters[*]} -eq 2  ]];
		then

			
			if [[ $(echo $(( ${#one} + ${#two} ))) -lt 4 ]];
			then 
			#echo ++++++++++$two
			continue
			fi


			 
			mdir=$path/$one$two$ddmmyy
			make_directory
			continue

		else
		three=''
		print_3
		fi
	done

}






print_3 (){
	
	for (( k=1; k<= $((100 - $i - $j )); k++ ))
	do
		
		if [[ $count -eq $num ]];
		then
			break
		fi

		three+=${letters[2]}

		if [[ ${#letters[*]} -eq 3  ]];
		then
			
			
			if [[ $(echo $(( ${#one} + ${#two} + ${#three} ))) -lt 4 ]];
				then 
				continue
			fi
		
			 
			mdir=$path/$one$two$three$ddmmyy
			make_directory
			continue		

		else
		four=''
		print_4

		fi
	done

}





print_4 () {

	for (( p=1; p<= $((100 - $i - $j - $k)); p++ ))
	do


		if [[ $count -eq $num ]];
		then
			break
		fi

		four+=${letters[3]}

		if [[ ${#letters[*]} -eq 4  ]];
		
			then 
			mdir=$path/$one$two$three$four$ddmmyy
			make_directory
			continue

		else
		five=''
		print_5
		
		fi
	done

}






print_5 () {

	for (( r=1; r<= $((100 - $i - $j - $k -$p )); r++ ))
	do
		
		if [[ $count -eq $num ]];
		then
			break
		fi

		five+=${letters[4]}

		if [[ ${#letters[*]} -eq 5  ]];
		
			then 
			mdir=$path/$one$two$three$four$five$ddmmyy
			make_directory
			continue

		else
		six=''
		print_6

		fi
	done



}








print_6 () {

	for (( t=1; t<= $((100 - $i - $j - $k - $p - $r )); t++ ))
	do
		
		if [[ $count -eq $num ]];
		then
			break
		fi

		six+=${letters[5]}
		if [[ ${#letters[*]} -eq 6  ]];

			then 
			mdir=$path/$one$two$three$four$five$six$ddmmyy
			make_directory

			continue
		else			
		seven=''
		print_7
		fi
	done

}





print_7 () {

	for (( u=1; u<= $((100 - $i - $j - $k - $p - $r - $t )); u++))
	do
		
		if [[ $count -eq $num ]];
		then
			break
		fi

		seven+=${letters[6]}
		if [[ ${#letters[*]} -eq 7  ]];

			then 

			mdir=$path/$one$two$three$four$five$six$seven$ddmmyy
			make_directory

			continue
		fi
	done

}










	







