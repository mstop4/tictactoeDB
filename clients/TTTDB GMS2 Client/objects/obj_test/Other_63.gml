/// @description handle dialogs

var res_id = async_load[? "id"];

if (res_id == moves_post)
{
	if (async_load[? "status"])
	{
		moves = async_load[? "result"];
		moves_ready = true;
		gameAdd(moves, winner);
	}
}

else if (res_id == winner_post)
{
	if (async_load[? "status"])
	{
		winner = async_load[? "result"];
		winner_ready = true;
		gameAdd(moves, winner);
	}
}

else if (res_id == moves_get)
{
	if (async_load[? "status"])
	{
		moves = async_load[? "result"];
		moves_ready = true;
		gameSearch(moves, winner);
	}
}

else if (res_id == winner_get)
{
	if (async_load[? "status"])
	{
		winner = async_load[? "result"];
		winner_ready = true;
		gameSearch(moves, winner);
	}
}