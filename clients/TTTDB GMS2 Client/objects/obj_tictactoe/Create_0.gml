/// @description Init

#macro SERVER_ADDRESS "http://localhost:3000"

randomize();
initEnums();

symbol[0] = "X";
symbol[1] = "O";

delayedGame = true;
gameOver = false;
moves = "";
numPlayers = 0;
myTurn = 0;
whoseTurn = 0;
winLineType = "";
winLineIndex = -1;

compStrategy[0] = strategy.winnerOnly;
compStrategy[1] = strategy.loserOnly;

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
		myTurn = whoseTurn;
		break;
	case 1:
		myTurn = choose(0, 1);
		break;
	default:
		myTurn = -1;
}

isItCompTurn();