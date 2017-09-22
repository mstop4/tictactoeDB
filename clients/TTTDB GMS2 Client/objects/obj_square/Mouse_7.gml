/// @description Insert description here
// You can write your code in this editor
with (obj_tictactoe) 
{
	if (!gameOver && other.value == "" && numPlayers > 0)
	{
		other.value = symbol[whoseTurn];
		grid[other.index mod 3, other.index div 3] = other.value;
		moves += string(other.index);
	
		checkForWinner();
	}
}