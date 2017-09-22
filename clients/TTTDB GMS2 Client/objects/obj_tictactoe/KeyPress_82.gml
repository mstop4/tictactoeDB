/// @description Insert description here
// You can write your code in this editor

gameOver = false;
moves = "";
whoseTurn = 0;
winLineType = "";
winLineIndex = -1;

for (var i=0; i<3; i++)
{
	for (var j=0; j<3; j++)
		grid[i, j] = "";
}

with (obj_square)
	value = "";

switch (numPlayers)
{
	case 0:
		myTurn = whoseTurn;
		break;
	case 1:
		myTurn = choose(0, 1);
		break;
	default:
		myTurn = -1;
}

isItCompTurn();