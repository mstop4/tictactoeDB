/// @description serve response

var res_id = async_load[? "id"];

if (res_id == searchReq)
{
	if (async_load[? "status"] == 0)
	{
		// decode JSON
		json = json_decode(async_load[? "result"]);
		var resList = json[? "default"];
		
		// check for connect to server (macOS)
		if (resList == "unknown error")
		{
			resultsMes = "Could not connect to server.";
			
			if (compStrategy[myTurn] == strategy.winnerOnly)
				strategy_winnerOnly("NO RESULTS", myTurn);
			else if (compStrategy[myTurn] == strategy.loserOnly)
				strategy_loserOnly("NO RESULTS", myTurn);
		}
		
		else 
		{
			var resListSize = ds_list_size(resList);
			resultsMes = "";
		
			// Check for "NO RESULTS" first
			var resObj = resList[| 0];		
			if (!is_undefined(ds_map_find_value(resObj, "error")) && resObj[? "error"] == "NO RESULTS")
			{
				resultsMes = "No games found.";
			
				if (compStrategy[myTurn] == strategy.winnerOnly)
					strategy_winnerOnly("NO RESULTS", myTurn);
				else if (compStrategy[myTurn] == strategy.loserOnly)
					strategy_loserOnly("NO RESULTS", myTurn);
			}
		
			else
			{
				for (var i=0; i<resListSize; i++)
				{
					resObj = resList[| i];
					resultsMes += "Id: " + string(resObj[? "id"]) +
										  ", Moves: " + resObj[? "moves"] +
											", Winner: " + resObj[? "winner"] + "\n";
				}
				if (compStrategy[myTurn] == strategy.winnerOnly)
					strategy_winnerOnly(resList, myTurn);
				else if (compStrategy[myTurn] == strategy.loserOnly)
					strategy_loserOnly(resList, myTurn);
			}
		}
	}
	
	else
	{
		resultsMes = "null";
		if (compStrategy[myTurn] == strategy.winnerOnly)
			strategy_winnerOnly("NO RESULTS", myTurn);
		else if (compStrategy[myTurn] == strategy.loserOnly)
			strategy_loserOnly("NO RESULTS", myTurn);
	}
}