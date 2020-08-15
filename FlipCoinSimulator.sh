#!/bin/bash 

echo "Welcome Flip Coin Simulation"

#constant
HEAD=1
TAIL=0

#declare dictionary
declare -A dictionary

coin=$((RANDOM%2))
if [ $coin -eq $HEAD ]
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
			if [ $coin -eq $HEAD ]
			then
				string+=H
			else
				string+=T
			fi
done
	dictionary[$string]=$(( ${dictionary[$string]}+1 ))
done
echo "${!dictionary[@]}":"${dictionary[@]}"
}

#percentage  calculated
function percentageFind()
{
	for keys in ${!dictionary[@]}
	{

		persentage=`echo "scale=2; $((${dictionary[$keys]}))/$flipCoin*100" | bc`
   }
}

read -p  "How many time you flip coin" flipCoin
read -p  "combination single press 1) double press 2)" choice

#call method
if [ $choice -eq 1 ]
then
	combination $flipCoin $choice
	percentageFind
elif [ $choice -eq 2 ]
then
	combination $flipCoin $choice
   percentageFind
else
	echo "Please Enter a Right Choice" 
fi
