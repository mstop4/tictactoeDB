/// @description Check for HTTP responses

var res_id = async_load[? "id"];

if (res_id == post_game)
{
	show_message_async("OK");
}

else if (res_id == get_game)
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
		show_message_async(contents);
	}
	else
		json = "null"
}