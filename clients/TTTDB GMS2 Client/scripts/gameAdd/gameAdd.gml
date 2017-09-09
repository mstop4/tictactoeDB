var url = SERVER_ADDRESS + "/api/add?moves=" + argument[0] + "&winner=" + argument[1];
post_game = http_post_string(url, "");
