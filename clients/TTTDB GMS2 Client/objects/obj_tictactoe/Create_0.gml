/// @description Init

randomize();

gameOver = false;
moves = "";
numPlayers = 0;
mySymbol = "";
whoseTurn = "X";
winLineType = "";
winLineIndex = -1;

compStrategy[0] = 1;
compStrategy[1] = 1;

xWins = 0;
oWins = 0;
cGames = 0;

searchReq = -1;
searchMes = "";
resultsMes = "";
possibleMovesMes = "";

for (var j=0; j<3; j++)
{
	for (var i=0; i<3; i++)
	{
		var s = instance_create_layer(x+i*64,y+j*64,"Instances",obj_square);
		s.index = j*3+i;
		grid[i, j] = "";
	}
}

switch (numPlayers)
{
	case 0:
		mySymbol = "X";
		break;
	case 1:
		mySymbol = choose("X", "O");
		break;
	default:
		mySymbol = "";
}

isItCompTurn();