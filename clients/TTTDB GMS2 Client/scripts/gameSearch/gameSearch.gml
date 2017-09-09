var url = SERVER_ADDRESS + "/api/search/json?moves=" + argument[0] + "&winner=" + argument[1];
return http_get(url);
