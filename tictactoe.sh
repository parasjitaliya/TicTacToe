#!/bin/bash
echo "-----------Welcome Tic Tac Toe------------"
declare -A Arr
player=1
rows=3
columns=3
check=$((RANDOM%2))
movecount=0
totalcount=8
flage=0
ch=0
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
		Arr[$row,$column]=$computer
		((movecount++))
		displayBoard
	else
		echo "Position Occupied Or Invalid Position"
	fi
}
function checkWinPosition
{
	for ((i=0;i<rows;i++))
	do
		for ((j=0;j<column;j++))
		do
			Horizontal=${Arr[$i,$j]}${Arr[$i,$((j+1))]}${Arr[$i,$((j+2))]}
			if [[ $Horizontal == "$player$player$player" ]]
			then
  				echo "You Won Horizontically!!"
			elif [[ $Horizontal == "$computer$computer$computer" ]]
			then
				echo "Computer Won Horizontically!!"
				exit
			fi

			Vertical=${Arr[$j,$i]}${Arr[$((j+1)),$i]}${Arr[$((j+2)),$i]}
			if [[ $Vertical == "$player$player$player" ]]
			then
				echo "You Won Vertically!!"
      			elif [[ $Vertical == "$computer$computer$computer" ]]
			then
				echo "Computer Won vertically!!"
				exit
   			fi

			firstDiagonal=${Arr[$i,$j]}${Arr[$((i+1)),$((j+1))]}${Arr[$((i+2)),$((j+2))]}  
			secondDiagonal=${Arr[$i,$(($j+2))]}${Arr[$(($i+1)),$(($j+1))]}${Arr[$(($i+2)),$j]} 
			if [[ $firstDiagonal == "$player$player$player" ]] || [[ $secondDiagonal == "$player$player$player" ]]
   			then
				echo "You Won Diagonally!!"
				exit
			elif [[ $firstDiagonal == "$computer$computer$computer" ]] || [[ $secondDiagonal == "$computer$computer$computer" ]]
			then
				echo "Computer Won Diagonally!!"
				exit
			fi
		done
	done
	flage=1
}
function tieGame(){
if [[ $movecount -eq $totalcount ]]
then  
      echo "Match Tie!!"
      exit
fi
}
function userTurn()
{
	read -p "Enter row" row
	read -p "Enter column" column
		if [[ ${Arr[$row,$column]} == "-" ]]
		then
			Arr[$row,$column]=$player
			((movecount++))
			echo $movecount
			displayBoard
			checkWinPosition
			if [ $movecount -ge 4 ]
			then
				if [ flage = 1 ]
				then 
					read -p "the move is not wining move you want to go with same then press (1) change your move then press (2)" ch
				        if [ $ch = 1]
        				then
                				computerTutn
        				else
						Arr[$row,$column]="-"
			                        ((movecount--))

						read -p "Enter row" row
						read -p "Enter column" column
                				if [[ ${Arr[$row,$column]} == "-" ]]
                				then
                        				Arr[$row,$column]=$player
                        				((movecount++))
                        				echo $movecount
                       					displayBoard
                        				checkWinPosition
				                        if [ $movecount -ge 4 ]
                        				then
                                				if [ flage = 1 ]
                                				then 
									 Arr[$row,$column]="-"
                                        				userTurn
                                				fi
                        				else
                                				computerTurn
                        				fi
                				else
                        				echo "Position Occupied Or Invalid Position For User!!"
                        				tieGame
                       					userTurn
               				 	fi
					fi
				else
					computerTurn
				fi
			else
				computerTurn
			fi
		else
			echo "Position Occupied Or Invalid Position For User!!"
			tieGame
			userTurn
	fi
}

function computerTurn()
{
	row=$((RANDOM%3))
	echo $row
	column=$((RANDOM%3))
	echo $column
		if [[ ${Arr[$row,$column]} == "-" ]]
		then
			Arr[$row,$column]=$computer
			((movecount++))
			displayBoard
			checkWinPosition
			userTurn
		else
			echo "Position Occupied Or Invalid Position For Computer!!"	
			tieGame
			computerTurn
		fi
}

function Symbol(){
	if [ $check == 1 ]; 
	then 
		player="X"
		computer="O"
  	else 
		player="0"
		computer="X" 
	fi
	echo player $player assigned
	echo computer $computer assigned
}
Symbol
resetBoard
while [[ $movecount -lt $totalcount ]]
do
	computerTurn
	checkHorizontal
        checkVertical
        diagonally

done
