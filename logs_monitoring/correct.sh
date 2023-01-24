#!/bin/bash


if [[ $# -ne 1 || $1 -gt 4 || $1 -lt 1  ]];
then
	echo "Wrong argument (should be only 1 argument form 1 to 4)"
	exit
fi
