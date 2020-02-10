#!/bin/bash
echo "-----------Welcome Tic Tac Toe------------"
declare -A Arr
player=1
rows=3
columns=3
check=$((RANDOM%2))
movecount=1
totalcount=9
resetBoard()
{
	for ((i=0;i<$rows;i++))
	do
		for ((j=0;j<$columns;j++))
		do
			Arr[$i,$j]="-"
		done
	done
	echo "--Game started--"
}
function toss(){
	if [ $check -eq 1 ]
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
			echo -n "| ${Arr[$i,$j]} "
		done
			echo "|"
			echo "-------------"
	done
}
function checkBlankCell(){
	read -p "Enter row" row
	read -p "Enter column" column
	if [[ ${Arr[$row,$column]} == "-" ]]
	then
		Arr[$row,$column]=$player
		((movecount++))
		displayBoard
	else
		echo "Position Occupied Or Invalid Position"
	fi
}
function checkHorizontal
{
	for ((i=0;i<rows;i++))
	do
		for ((j=0;j<column;j++))
		do
			Horizontal=${Arr[$i,$j]}${Arr[$i,$((j+1))]}${Arr[$i,$((j+2))]}
			if [[ $Horizontal == "$player$player$player" ]]
			then
  				echo "You Won Horizontically!!"
			exit
			fi
		done
	done
}
function checkVertical
{
	for ((i=0;i<rows;i++))
        do
                for ((j=0;j<column;j++))
                do

			Vertical=${Arr[$j,$i]}${Arr[$((j+1)),$i]}${Arr[$((j+2)),$i]}
			if [[ $Vertical == "$player$player$player" ]]
			then
				echo "You Won Vertically!!"
      			exit
   			fi
		done
	done
}
function diagonally
{
	for ((i=0;i<rows;i++))
	do
		for ((j=0;j<column;j++))
		do
			if [[ ${Arr[$i,$j]}${Arr[$((i+1)),$((j+1))]}${Arr[$((i+2)),$((j+2))]} == "$player$player$player" ]] || [[ ${Arr[$i,$((j+2))]}${Arr[$((i+1)),
														$((j+1))]}${Arr[$((i+2)),$j]} == "$player$player$player" ]]
   			then
				echo "You Won Diagonally!!"
				exit
			fi
		done
	done

}

function Symbol(){
	if [ $player == 1 ]; 
	then 
		player=O
  	else 
		player=X; 
	fi
	echo player $player assigned
}
Symbol
resetBoard
while [[ $movecount -lt $totalcount ]]
do
	checkBlankCell
	checkHorizontal
        checkVertical
        diagonally

done
