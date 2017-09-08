var express = require('express');
var router = express.Router();
var db = require('../db');

/* GET game. */
router.get('/getOne', function(req, res, next) {

  db.getOneGame(parseInt(req.query.gameID))
    .then(game => {
      if (game) {
        res.render('gameInfo', {game: game.dataValues})
      } else {
        res.render('gameInfo', {game: null})
      }
    })
});

router.get('/getAll', function(req, res, next) {

  db.getAllGames()
    .then(games => {
        res.render('gameIndex', {games: games})
    })
});

module.exports = router;