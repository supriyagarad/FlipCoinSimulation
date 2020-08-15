#!/bin/bash 

echo "Welcome Flip Coin Simulation"

#declare dictionary
declare -A dictionary

#constant
HEAD=1
TAIL=0

coin=$((RANDOM%2))
if [ $coin -eq $HEAD ]
then
	echo "Head"
else
	echo "Tail"
fi

# Combinations of  coin
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
echo "All Combination : ${dictionary[@]}"
echo  "All keys 		 : ${!dictionary[@]}"
}

#Find percentage 
function percentageFind()
{
	for keys in ${!dictionary[@]}
	{

		persentage=`echo "scale=2; $((${dictionary[$keys]}))/$flipCoin*100" | bc`
		echo  "$keys =  $persentage"
   }
}

read -p  "How many time you flip coin" flipCoin
read -p  "combination single press 1) double press 2) third press for combination triplet " choice

#call method
if [ $choice -eq 1 ]
then
	combination $flipCoin $choice
	percentageFind
elif [ $choice -eq 2 ]
then
	combination $flipCoin $choice
   percentageFind
elif [ $choice  -eq 3 ]
then
   combination $flipCoin $choice
   percentageFind
else
	echo "Please Enter a Right Choice" 
fi
