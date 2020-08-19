#!/bin/bash -x

DAY=0
STAKE=100
BET=1
bet(){
	if [ $((RANDOM % 2)) -eq 1 ]
	then
		echo "You Won"
		STAKE=$(($STAKE + $BET))
	else
		echo "You Loose"
		STAKE=$(($STAKE - $BET))
	fi
}
bet

