for (var i=0; i<3; i++)
{
	// Rows
	if (grid[0,i] <> "" && (grid[0,i] == grid[1,i] && grid[0,i] == grid[2,i]))
		return [true, "row", i, grid[0,i]];
		
	// Columns
	if (grid[i,0] <> "" && (grid[i,0] == grid[i,1] && grid[i,0] == grid[i,2]))
		return [true, "column", i, grid[i,0]];	
}

// Diagonals

if (grid[0,0] <> "" && (grid[0,0] == grid[1,1] && grid[0,0] == grid[2,2]))
	return [true, "diagonal", 0, grid[0,0]];
	
if (grid[2,0] <> "" && (grid[2,0] == grid[1,1] && grid[2,0] == grid[0,2]))
	return [true, "diagonal", 1, grid[2,0]];
	
return [false, "", 0, ""];