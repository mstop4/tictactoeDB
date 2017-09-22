///@param moves moves
///@param winner winner

var url = SERVER_ADDRESS + "/api/add?moves=" + argument[0] + "&winner=" + argument[1];
return http_post_string(url, "");
