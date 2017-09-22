/// @description Start computer turn

if (!gameOver)
{
	if (compStrategy[whoseTurn] == 1)
	{
		searchReq = gameSearch(moves, mySymbol);
		searchMes = "Search #" + string(searchReq) + ": searching for " + moves;
	}
	
	else
	{
		strategy_random(mySymbol);
	}
}