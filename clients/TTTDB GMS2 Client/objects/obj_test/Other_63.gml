/// @description Insert description here
// You can write your code in this editor

var res_id = ds_map_find_value(async_load, "id");

if (res_id == moves_diag)
{
	if (ds_map_find_value(async_load, "status"))
	{
		moves = ds_map_find_value(async_load, "result");
		moves_ready = true;
		gameAdd(moves, winner);
	}
}

else if (res_id == winner_diag)
{
	if (ds_map_find_value(async_load, "status"))
	{
		winner = ds_map_find_value(async_load, "result");
		winner_ready = true;
		gameAdd(moves, winner);
	}
}