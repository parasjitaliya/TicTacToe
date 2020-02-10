#!/bin/bash
echo "-----------Welcome Tic Tac Toe------------"
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
resetBoard
