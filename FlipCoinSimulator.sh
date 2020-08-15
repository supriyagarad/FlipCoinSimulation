#!/bin/bash -x

echo "Welcome Flip Coin Simulation"

declare -A dictionary

coin=$((RANDOM%2))
if [ $coin -eq 1 ]
then
	echo "Head"
else
	echo "Tail"
fi
