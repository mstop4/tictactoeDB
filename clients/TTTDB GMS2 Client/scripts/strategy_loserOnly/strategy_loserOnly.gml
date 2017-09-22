/// @param resList resList
/// @param turnIndex turnIndex

if (!gameOver && whoseTurn == argument[1])
{
	var raffle = ds_list_create();
	possibleMovesMes = "";
	movePos = string_length(moves)+1;
	
	// find moves remaining
	for (var i=0; i<9; i++)
	{
		if (string_pos(string(i),moves) == 0)
			ds_list_add(raffle, i);
	}
	
	// remove all moves that lead to losses
	if (argument[0] <> "NO RESULTS")
	{
		for (var i=0; i<ds_list_size(argument[0]); i++)
		{
			var resObj = ds_list_find_value(argument[0], i);
			var moveNum = real(string_char_at(resObj[? "moves"], movePos));
			
			if (ds_list_find_index(raffle,moveNum) <> -1)
				ds_list_delete(raffle, ds_list_find_index(raffle,moveNum));
		}
	}
	
	// if no moves possible, fallback to random strategy
	if (ds_list_size(raffle) == 0)
	{
		for (var i=0; i<9; i++)
		{
			if (string_pos(string(i),moves) == 0)
				ds_list_add(raffle, i);
		}
	}
	
	strategy_common(raffle, argument[1]);
	
	checkForWinner();
	
	ds_list_destroy(raffle);
}