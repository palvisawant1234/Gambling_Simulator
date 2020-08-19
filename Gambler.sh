#!/bin/bash -x

DAY=0
STAKE=100
BET=1
MAXLIMIT=$(($STAKE + $(($STAKE * 50 / 100)) ))
MINLIMIT=$(($STAKE - $(($STAKE * 50 / 100)) ))

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

day(){
        STAKE=100
        while [ $STAKE -lt $MAXLIMIT ] && [ $STAKE -gt $MINLIMIT ]
        do
                bet
        done
        echo "Your final stake = $STAKE"
}
day

