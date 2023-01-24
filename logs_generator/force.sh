#!/bin/bash


log_ct () {

for date_log in 01.07.2022 02.07.2022 03.07.2022 04.07.2022 05.07.2022
do

	date="$date_log"
	log_day="nginx_log_$date_log"
	files_gen
done

}


copy_to () {

echo $ip $unswer $method $date $url $agent >> $log_day
#	echo $ip >> $log_day
#	echo $unswer >> $log_day
#	echo $method >> $log_day
#	echo $date >> $log_day
#	echo $url >> $log_day
#	echo $agent >> $log_day

}




files_gen () {

	for (( i=1; i<=$(shuf -i 100-1000 -n1); i++))
	do
		ip_gen
		unswer_gen
		method_gen
		url_gen
		agent_gen
		copy_to
	done


}


ip_gen () {


	ip="$(shuf -i 1-255 -n1).$(shuf -i 1-255 -n1).$(shuf -i 1-255 -n1).$(shuf -i 1-255 -n1)"


	}


unswer_gen () {
	
	unswer_arr=(200 201 400 401 403 404 500 501 502 503)	
	unswer="${unswer_arr[$(shuf -i 0-9 -n1)]}"

#200 - ok success 
#201 - ok create (made new resourse)
#400 - bad request (wrong syntaxis)
#401 - Unauthorized (not enouf athorized data)
#403 - Forbidden (get post but do t want to autorized)
#404 - Not Found
#500 - Internal Server Error (server got unexpected error, that deny make request)
#501 - Not Implemented (server do not support the functionality required to fulfil the request)
#502 - Bad Gateway (wrong responce from upstream server)
#503 - Service Unavailable (server operates proparly, but cant handle a request at the moment)


}


method_gen () {

	method_gen=(GET POST PUT PATCH DELETE)	
	method="${method_gen[$(shuf -i 0-4 -n1)]}"

}





url_gen () {

	alph=(q w e r t y u i o p a s d f g h j k l z x c v b n m)
	
	for (( al=1; al <= $(shuf -i 5-20 -n1); al++ ))
	do
		add_url+=${alph[$(shuf -i 0-25 -n1)]}
	done

	url="http://random-server/$add_url"
	add_url=""
	

}



agent_gen () {

	agents=("Mozila Firefox" "Google Chrome" "Opera" "Safari" "internet Explorer" "Mircosoft Edge" "Crowler and bot" "Library and net tool")
	 agent=\"${agents[$(shuf -i 0-7 -n1)]}\"
	

}

