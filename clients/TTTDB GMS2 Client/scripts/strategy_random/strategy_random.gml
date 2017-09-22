/// @param turnIndex turnIndex

if (!gameOver && whoseTurn == argument[0])
{
	var raffle = ds_list_create();
	possibleMovesMes = "";
	movePos = string_length(moves)+1;
	
	for (var i=0; i<9; i++)
	{
		if (string_pos(string(i),moves) == 0)
			ds_list_add(raffle, i);
	}

	strategy_common(raffle, argument[1]);
	
	checkForWinner();
	ds_list_destroy(raffle);
}