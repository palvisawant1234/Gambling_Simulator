

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
for ((i=1;i<=20;i++))
do
	day
	echo "Day:$i	Stake:$STAKE"
	totalAmount=$(($totalAmount+$actualGain))
done
if [ $totalAmount -gt 0 ]
	then
		echo "Total amount won in 20 days: $totalAmount"
        else
                echo "Total amount lost in 20 days: $totalAmount"
        fi
}
total

