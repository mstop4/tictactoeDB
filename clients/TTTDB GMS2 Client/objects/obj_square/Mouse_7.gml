/// @description Insert description here
// You can write your code in this editor

if (!obj_tictactoe.gameOver && value == "" && obj_tictactoe.numPlayers > 0)
{
	if (obj_tictactoe.whoseTurn == "X")
	{
		value = "X";
		obj_tictactoe.whoseTurn = "O";
		
		isItCompTurn();
	}

	else if (obj_tictactoe.whoseTurn == "O")
	{
		value = "O";
		obj_tictactoe.whoseTurn = "X";
		
		isItCompTurn();
	}
	
	obj_tictactoe.grid[index mod 3, index div 3] = value;
	obj_tictactoe.moves += string(index);
	
	with (obj_tictactoe) 
	{
		var result = checkForWinner();
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
		}
		
		else if (string_length(moves) >= 9)
		{
			gameOver = true;
			cGames++;
			gameAdd(moves, "C");
		}
	}
}