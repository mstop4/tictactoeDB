if (winner_ready && moves_ready)
{
  var url = SERVER_ADDRESS + "/api/search?moves=" + argument[0] + "&winner=" + argument[1];
	get_game = http_get(url);
													 
	winner_ready = false;
	moves_ready = false;
}