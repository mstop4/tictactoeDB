/// @description handle dialogs

var res_id = async_load[? "id"];

if (res_id == moves_post)
{
	if (async_load[? "status"])
	{
		moves = async_load[? "result"];
		moves_ready = true;
		
		if (winner_ready && moves_ready)
		{
			gameAdd(moves, winner);
			winner_ready = false;
			moves_ready = false;
		}
	}
}

else if (res_id == winner_post)
{
	if (async_load[? "status"])
	{
		winner = async_load[? "result"];
		winner_ready = true;
		
		if (winner_ready && moves_ready)
		{
			gameAdd(moves, winner);
			winner_ready = false;
			moves_ready = false;
		}
	}
}

else if (res_id == moves_get)
{
	if (async_load[? "status"])
	{
		moves = async_load[? "result"];
		moves_ready = true;
		if (winner_ready && moves_ready)
		{
			gameSearch(moves, winner);
			winner_ready = false;
			moves_ready = false;
		}
	}
}

else if (res_id == winner_get)
{
	if (async_load[? "status"])
	{
		winner = async_load[? "result"];
		winner_ready = true;
		
		if (winner_ready && moves_ready)
		{
			gameSearch(moves, winner);
			winner_ready = false;
			moves_ready = false;
		}
	}
}