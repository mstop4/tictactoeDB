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

searchReq = -1;
searchMes = "";
resultsMes = "";

for (var j=0; j<3; j++)
{
	for (var i=0; i<3; i++)
	{
		var s = instance_create_layer(x+i*64,y+j*64,"Instances",obj_square);
		s.index = j*3+i;
		grid[i, j] = "";
	}
}