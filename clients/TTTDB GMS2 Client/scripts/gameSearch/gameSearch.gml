var url = SERVER_ADDRESS + "/api/search/json?moves=" + argument[0] + "&winner=" + argument[1];
get_game = http_get(url);
