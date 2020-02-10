#!/bin/bash
echo "-----------Welcome Tic Tac Toe------------"
player=1
rows=3
columns=3
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
player=$((player%2+1))
if [ $player == 1 ]; 
then 
	sym=O
  else 
	sym=X; 
fi
echo $sym
resetBoard
