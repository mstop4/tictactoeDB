/// @param raffle raffle
/// @param mySymbol mySymbol

for (var i=0; i<ds_list_size(argument[0]); i++)
possibleMovesMes += string(ds_list_find_value(argument[0], i)) + " ";
	
ds_list_shuffle(argument[0]);
	
with (obj_square)
{
	if (index == ds_list_find_value(argument[0], 0))
	{
		value = argument[1];
		other.grid[index mod 3, index div 3] = value;
		other.moves += string(index);
	}
}