/// @description Insert description here
// You can write your code in this editor

var lineWidth = 6;

if (winLineType <> "" && winLineIndex > -1)
{
	switch (winLineType)
	{
		case "row":
			draw_line_width(x-16,y+winLineIndex*64+32,x+64*3+16,y+winLineIndex*64+32,lineWidth);
			break;
			
		case "column":
			draw_line_width(x+winLineIndex*64+32,y-16,x+winLineIndex*64+32,y+64*3+16,lineWidth);
			break;	
			
		case "diagonal":
		{
			if (winLineIndex == 0)
				draw_line_width(x-16,y-16,x+64*3+16,y+64*3+16,lineWidth);
			else if (winLineIndex == 1)
				draw_line_width(x+64*3+16,y-16,x-16,y+64*3+16,lineWidth);
			break;
		}	
	}
}