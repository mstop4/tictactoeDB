/// @param resList resList
/// @param mySymbol mySymbol

if (!gameOver && whoseTurn == argument[1])
{
	var raffle = ds_list_create();
	possibleMovesMes = "";
	movePos = string_length(moves)+1;
	
	if (argument[0] <> "NO RESULTS")
	{
		for (var i=0; i<ds_list_size(argument[0]); i++)
		{
			var resObj = ds_list_find_value(argument[0], i);
			var moveNum = real(string_char_at(resObj[? "moves"], movePos));
			
			if (ds_list_find_index(raffle,moveNum) == -1)
				ds_list_add(raffle, moveNum);
		}
	} 	
	
	else
	{
		for (var i=0; i<9; i++)
		{
			if (string_pos(string(i),moves) == 0)
				ds_list_add(raffle, i);
		}
	}
	
	for (var i=0; i<ds_list_size(raffle); i++)
		possibleMovesMes += string(raffle[| i]) + " ";
	
	ds_list_shuffle(raffle);
	
	with (obj_square)
	{
		if (index == raffle[| 0])
		{
			value = argument[1];
			other.grid[index mod 3, index div 3] = value;
			other.moves += string(index);
		}
	}
	
	var result = checkForWinner();
	var rStr = "";
		
	if (result[0])
	{						 
		winLineType = result[1];
		winLineIndex = result[2];
		gameOver = true;
		
		gameAdd(moves, result[3]);
	}
	
	else
	{
		if (argument[1] == "X")
			whoseTurn = "O";
		else
			whoseTurn = "X";
	}
	ds_list_destroy(raffle);
}