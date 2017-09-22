///@param mySymbol mySymbol

var result = checkLines();
var rStr = "";
		
if (result[0])
{						 
	winLineType = result[1];
	winLineIndex = result[2];
	gameOver = true;
		
	gameAdd(moves, result[3]);
		
	if (result[3] == "X")
		xWins++;
	else if (result[3] == "O")
		oWins++;
		
	if (numPlayers == 0)
		alarm[1] = 2;
}
	
else
{
	if (argument[0] == "X")
		whoseTurn = "O";
	else
		whoseTurn = "X";
			
	if (numPlayers == 0)
	{
		if (string_length(moves) >= 9)
		{
			alarm[1] = 2;
			gameOver = true;
			gameAdd(moves, "C");
			cGames++;
		}
			
		else
		{
			mySymbol = whoseTurn;
			isItCompTurn();
		}
	}
}