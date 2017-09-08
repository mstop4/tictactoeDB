var express = require('express');
var router = express.Router();
var db = require('../db');

/* GET game. */
router.get('/find', function(req, res, next) {

  db.findGame(parseInt(req.query.gameID))
    .then(game => {
      if (game) {
        res.render('gameInfo', {game: game.dataValues})
      } else {
        res.render('gameInfo', {game: null})
      }
    })
});

router.get('/search', function(req, res, next) {

  db.searchGames(req.query.moves, req.query.winner)
    .then(games => {

        let sMoves = req.query.moves ? req.query.moves : "Any"
        let sWinner = req.query.winner ? req.query.winner : "Any"

        res.render('gameIndex', {
          games: games,
          moves: sMoves,
          winner: sWinner
        })
    })
});

module.exports = router;