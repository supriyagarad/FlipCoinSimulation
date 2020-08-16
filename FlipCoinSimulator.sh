#!/bin/bash  

echo "Welcome Flip Coin Simulation"

#constant
SINGLET=1
DOUBLET=2
TRIPLET=3

#flips coin and gerate the combination
function simulator()
{
	local flips=$1
	local combination=$2
	
	#declaring a dictionary
	declare -A coinCombination

	for((i=1;i<=flips;i++))
	do
		coinSides=""
		for((j=1;j<=combination;j++))
		do
			if [[ $(( RANDOM % 2 )) -eq 0 ]]; then
				coinSides+="H"
			else
				coinSides+="T"
			fi
		done
		coinCombination[$coinSides]=$((${coinCombination[$coinSides]}+1))
	done
	combinationPercentage
}

#calculate percentage of each combination 
function combinationPercentage
{
	echo "Combination  :  Percentage "
	for i in ${!coinCombination[@]}
	do
		coinCombination[$i]=$(( coinCombination[$i]*100/flips ))
		echo $i"    "${coinCombination[$i]}	
done
	winningCombination
}

#Sort combination in descending order and display winning combination
function winningCombination()
{
	echo "Winning combination : Percentage "
	for i in ${!coinCombination[@]}
	do
		echo -e "$i : ${coinCombination[$i]}"
	done | sort -k3 -rn | head -n 1
}

#start flip coin simulation for singlet, doublet
function startSimulation()
{
	read -p "do you want to play the game? if yes press 'y' otherwise press any key for exit :  " play
	while [  $play == 'y' ]
	do
		read -p "How many times do you want to flips the coin? : " flips
		echo -e "Which combination you want\nEnter your choice\n 1.Singlet\n 2.Doublet\n 3.Triplet : "
		read combination
		case $combination in
		$SINGLET)
			simulator $flips $combination
			;;
		$DOUBLET)
			simulator $flips $combination
			;;
		$TRIPLET)
			simulator $flips $combination
			;;
       *)
			echo "Invalid Choice"
         ;;
	esac
	read -p "Do you want to play again? if yes press 'y' otherwise press any key for exit : " play
   done
}

#Start the flip coin Simulation
startSimulation
