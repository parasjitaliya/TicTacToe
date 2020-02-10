#!/bin/bash
echo "-----------Welcome Tic Tac Toe------------"
player=1
rows=3
columns=3
check=$((RANDOM%2))
resetBoard()
{
	for ((i=0;i<$rows;i++))
	do
		for ((j=0;j<$columns;j++))
		do
			board[$i,$j]="-"
		done
	done
	echo "--Game started--"
}
function toss(){
	if [ $check -eq $player ]
	then
		echo PLAYER $player has won Toss
	else
		echo PLAYER $player has won Toss
	fi
}
function displayBoard(){
	echo "-------------"
	for (( i=0; i<$rows; i++ ))
	do
		for (( j=0; j<$columns; j++ ))
		do
			echo -n "| ${board[$i,$j]} "
		done
			echo "|"
			echo "-------------"
	done
}

player=$((player%2+1))
if [ $player == 1 ]; 
then 
	sym=O
  else 
	sym=X; 
fi
resetBoard
toss
displayBoard
