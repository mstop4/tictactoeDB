/// @description Insert description here
// You can write your code in this editor

if (!gameOver && whoseTurn == turn.O)
{
	var raffle = ds_list_create();

	for (var i=0; i<9; i++)
	{
		if (string_pos(string(i),moves) == 0)
			ds_list_add(raffle, i);
	}
	
	ds_list_shuffle(raffle);
	
	with (obj_square)
	{
		if (index == raffle[| 0])
		{
			value = "O"
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
		whoseTurn = turn.X;
	ds_list_destroy(raffle);
}