/// @description Insert description here
// You can write your code in this editor

var res_id = async_load[? "id"];

if (res_id == searchReq)
{
	if (async_load[? "status"] == 0)
	{
		json = json_decode(async_load[? "result"]);
		var resList = json[? "default"];
		var resListSize = ds_list_size(resList);
		var contents = "";
		
		// Check for "NO RESULTS" first
		var resObj = resList[| 0];		
		if (!is_undefined(ds_map_find_value(resObj, "error")) && resObj[? "error"] == "NO RESULTS")
		{
			contents = "No games found.";
		}
		else
		{
			for (var i=0; i<resListSize; i++)
			{
				resObj = resList[| i];
				contents += "Id: " + string(resObj[? "id"]) +
									  ", Moves: " + resObj[? "moves"] +
										", Winner: " + resObj[? "winner"] + "\n";
			}
		}
		resultsMes = contents;
	}
	else
		json = "null"
}

compTurn();