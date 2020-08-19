

STAKE=100
BET=1
MAXLIMIT=$(($STAKE + $(($STAKE * 50 / 100)) ))
MINLIMIT=$(($STAKE - $(($STAKE * 50 / 100)) ))

bet(){
        if [ $((RANDOM % 2)) -eq 1 ]
        then
                STAKE=$(($STAKE + $BET))
        else
                STAKE=$(($STAKE - $BET))
        fi
}

day(){
        STAKE=100
        while [ $STAKE -lt $MAXLIMIT ] && [ $STAKE -gt $MINLIMIT ]
        do
                bet
        done
	actualGain=$(($STAKE-100))
}

total(){
for ((i=1;i<=30;i++))
do
	day
	echo "Day:$i	Stake:$STAKE"
	if [ $STAKE -eq 150 ]
	then 
		WON=$(($WON + 50))
		winDay=$(($winDay + 1))
	else
		LOSE=$(($LOSE + 50))
		loseDay=$(($loseDay + 1))
	fi
	totalAmount=$(($totalAmount+$actualGain))
done
echo "Total number of days won in month is $winDay and amount gained is $WON"
echo "Total number of days loose in month is $loseDay and amount loss is $LOSE"
if [ $totalAmount -gt 0 ]
	then
		echo "Total amount won in month: $totalAmount"
        else
                echo "Total amount lost in month: $totalAmount"
        fi
}
total

