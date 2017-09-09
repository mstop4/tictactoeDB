/// @description Insert description here
// You can write your code in this editor

if (!obj_tictactoe.gameOver && value == "")
{
	if (obj_tictactoe.whoseTurn == turn.X)
	{
		value = "X";
		obj_tictactoe.whoseTurn = turn.O;
		obj_tictactoe.alarm[0] = 30;
	}

	else if (obj_tictactoe.whoseTurn == turn.O)
	{
		value = "O";
		obj_tictactoe.whoseTurn = turn.X;
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
		}
	}
}