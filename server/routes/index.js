var express = require('express');
var router = express.Router();
var db = require('../lib/dbHelpers');
var moment = require('moment');

/* GET home page. */
router.get('/', function(req, res, next) {
  db.getMostRecentGames(10)
  .then(games => {

    // Send HTML
    res.render('index', {
      games: games,
      moment: moment
    })
  })
});

module.exports = router;
