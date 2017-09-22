var result = checkLines();
var rStr = "";
		
if (result[0])
{						 
	winLineType = result[1];
	winLineIndex = result[2];
	gameOver = true;
		
	gameAdd(moves, result[3]);
		
	if (result[3] == symbol[0])
		xWins++;
	else if (result[3] == symbol[1])
		oWins++;
		
	if (numPlayers == 0)
		alarm[1] = 2;
}
	
else
{
	whoseTurn = !whoseTurn;
			
	if (string_length(moves) >= 9)
	{
		if (numPlayers == 0) 
			alarm[1] = 2;
		gameOver = true;
		gameAdd(moves, "C");
		cGames++;
	}
			
	else
	{
		if (numPlayers == 0)
			myTurn = whoseTurn;
		isItCompTurn();
	}
}