/// @description Insert description here
// You can write your code in this editor

gameOver = false;
moves = "";
mySymbol = choose("X", "O");
whoseTurn = "X";
winLineType = "";
winLineIndex = -1;

for (var i=0; i<3; i++)
{
	for (var j=0; j<3; j++)
		grid[i, j] = "";
}

with (obj_square)
	value = "";
	
isItCompTurn();