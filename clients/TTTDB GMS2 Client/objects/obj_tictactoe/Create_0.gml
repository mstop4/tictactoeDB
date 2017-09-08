/// @description Insert description here
// You can write your code in this editor

enum turn {
	X, O
}

gameOver = false;
moves = "";
whoseTurn = turn.X;
winLineType = "";
winLineIndex = -1;

for (var i=0; i<3; i++)
{
	for (var j=0; j<3; j++)
	{
		var s = instance_create_layer(x+i*64,y+j*64,"Instances",obj_square);
		s.index = i*3+j;
		grid[i, j] = "";
	}
}