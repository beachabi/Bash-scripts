#!/bin/bash


#source $dir/force.sh


init_files () {

count_files=0
num_files=$num_files

one_files=''
two_files=''
three_files=''
four_files=''
five_files=''
six_files=''
seven_files=''

}


check_files () {
	
	if [[ $count_files -eq $num_files ]];
	then
		break
	fi
	
}


check_space () {

space=$(df / | awk 'NR==2{print $4}')

if [[ $space -lt 1000000 ]];
then
	echo "Space less then 1 GB"
	exit
fi
}






touch_files () {


if [[ $1 -eq 1 ]];
then
	touch_file=$mdir/$one_files$ddmmyy$type_files

elif [[ $1 -eq 2 ]];
then
	touch_file=$mdir/$one_files$two_files$ddmmyy$type_files

elif [[ $1 -eq 3 ]];
then
	touch_file=$mdir/$one_files$two_files$three_files$ddmmyy$type_files

elif [[ $1 -eq 4 ]];
then
	touch_file=$mdir/$one_files$two_files$three_files$four_files$ddmmyy$type_files

elif [[ $1 -eq 5 ]];
then
	touch_file=$mdir/$one_files$two_files$three_files$four_files$five_files$ddmmyy$type_files

elif [[ $1 -eq 6 ]];
then
	touch_file=$mdir/$one_files$two_files$three_files$four_files$five_files$six_files$ddmmyy$type_files

elif [[ $1 -eq 7 ]];
then touch_file=$mdir/$one_files$two_files$three_files$four_files$five_files$six_files$seven_files$ddmmyy$type_files

fi

check_space

echo_files=$touch_file', '$(echo $ddmmyy | sed s/"^_"//)', '$full_file_size
echo $echo_files
echo $echo_files 1>>log.log
fallocate -l $file_size $touch_file
#touch $touch_file


}








print_files_1 () {


	for (( ii=1; ii<= $((100 - ${#letters_files[*]} + 1)); ii++ ))
	do	
	
		if [[ $count_files -eq $num_files ]];
		then
			break
		fi

		one_files+=${letters_files[0]}

		if [[ ${#letters_files[*]} -eq 1  ]];
		then 
			
			if [[ $(echo $(( ${#one_files} + ${#two_files} + ${#three_files} ))) -lt 4 ]];
				then 
				continue
			fi
			
			touch_files "1"
			
			(( count_files++ ))
				
			
			
			continue
	
		else
		two_files=''
		print_files_2
		fi
	done

}





print_files_2 () {

	for (( jj=1; jj<= $((100 - $ii )); jj++ ))
	do
		

	
		if [[ $count_files -eq $num_files ]];
		then
			break
		fi

		two_files+=${letters_files[1]}

		if [[ ${#letters_files[*]} -eq 2  ]];
			then 
			
			
			if [[ $(echo $(( ${#one_files} + ${#two_files} + ${#three_files} ))) -lt 4 ]];
				then 
				continue
			fi



			touch_files "2"
			
			(( count_files++ ))
			continue
				
		else
		three_files=''
		print_files_3
		fi
	done

}






print_files_3 (){
	
	for (( kk=1; kk<= $((100 - $ii - $jj )); kk++ ))
	do
		

		
		if [[ $count_files -eq $num_files ]];
		then
			break
		fi
		
		three_files+=${letters_files[2]}

		if [[ ${#letters_files[*]} -eq 3  ]];
        	then


			if [[ $(echo $(( ${#one_files} + ${#two_files} + ${#three_files} ))) -lt 4 ]];
				then 
				continue
			fi


				touch_files "3"
				(( count_files++ ))
			continue
		else
		four_files=''
		print_files_4
		fi
	done

}





print_files_4 () {

	for (( pp=1; pp<= $((100 - $ii - $jj - $kk)); pp++ ))
	do

		if [[ $count_files -eq $num_files ]];
		then
			break
		fi

		four_files+=${letters_files[3]}

		if [[ ${#letters_files[*]} -eq 4  ]];
       		then
					touch_files "4"
					(( count_files++ ))
			continue
		else
		five_files=''
		print_files_5
		fi
	done

}






print_files_5 () {

	for (( rr=1; rr<= $((100 - $ii - $jj - $kk -$pp )); rr++ ))
	do

		if [[ $count_files -eq $num_files ]];
		then
			break
		fi


		five_files+=${letters_files[4]}

		if [[ ${#letters_files[*]} -eq 5  ]];
        	then
					touch_files "5"
					(( count_files++ ))
			continue
		else
		six_files=''
		print_files_6
		fi
	done



}








print_files_6 () {

	for (( tt=1; tt<= $((100 - $ii - $jj - $kk - $pp - $rr )); tt++ ))
	do

		if [[ $count_files -eq $num_files ]];
		then
			break
		fi

		six_files+=${letters_files[5]}

		if [[ ${#letters_files[*]} -eq 6  ]];
        	then
					touch_files "6"
					(( count_files++ ))
			continue
		else			
		seven_files=''
		print_files_7
		fi
	done

}





print_files_7 () {

	for (( uu=1; uu<= $((100 - $ii - $jj - $kk - $pp - $rr - $tt )); uu++))
	do

		if [[ $count_files -eq $num_files ]];
		then
			break
		fi

		seven_files+=${letters_files[6]}
		if [[ ${#letters_files[*]} -eq 7  ]];
       		then
					touch_files "7"
					(( count_files++ ))
			continue
		fi
	done

}










	







