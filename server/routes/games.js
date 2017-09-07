var express = require('express');
var router = express.Router();
var db = require('../db');

/* GET game. */
router.get('/getMoves', function(req, res, next) {

  db.getMoves(parseInt(req.query.gameID))
    .then(game => {
      res.render('gameInfo', {game: game.dataValues})
    })
});

router.get('/getAll', function(req, res, next) {

  db.queryGames()
    .then(games => {
        res.render('gameIndex', {games: games})
    })
});

module.exports = router;