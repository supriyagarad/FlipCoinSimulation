#!/bin/bash -x

echo "Welcome Flip Coin Simulation"

#variable
head=0
tail=0

#declare dictionary
declare -A dictionary

coin=$((RANDOM%2))
if [ $coin -eq 1 ]
then
	echo "Head"
else
	echo "Tail"
fi

function combination(){
	for (( i=0;i<$1;i++ ))
	do
		string=" "
		for (( j=0;j<$2;j++ ))
		do
			coin=$((RANDOM%2))
			if [ $coin -eq 1 ]
			then
				string+=head
			else
				string+=tail
			fi
done
	dictionary[$string]=$(( ${dictionary[$string]}+1 ))
done
echo "${!dictionary[@]}":"${dictionary[@]}"
}

#percentage  calculated

function percentage()
{
	for keys in {!dictionary[@]}
	{
		percentage=`echo "scale=2; $((${dictionary[$keys]}))/$flipCoin*100" | bc`
		echo "$keys = $percentage"
   }
}
read -p  "How many time you flip coin" flipCoin
