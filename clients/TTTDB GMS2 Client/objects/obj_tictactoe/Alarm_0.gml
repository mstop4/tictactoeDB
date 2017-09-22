/// @description Start computer turn

if (!gameOver)
{
	if (compStrategy[myTurn] == strategy.winnerOnly)
	{
		searchReq = gameSearch(moves, symbol[myTurn]);
		searchMes = "Search #" + string(searchReq) + ": searching for " + moves;
	}
	
	else if (compStrategy[myTurn] == strategy.loserOnly)
	{
		searchReq = gameSearch(moves, symbol[!myTurn]);
		searchMes = "Search #" + string(searchReq) + ": searching for " + moves;
	}
	
	else
	{
		strategy_random(myTurn);
	}
}