var express = require('express');
var router = express.Router();
var db = require('../db');

/* GET game. */
router.get('/getOne', function(req, res, next) {

  db.getOneGame(parseInt(req.query.gameID))
    .then(game => {
      res.json(game.dataValues)
    })
});

router.get('/search', function(req, res, next) {

  console.log(req.query.moves)

  db.searchGames(req.query.moves, req.query.winner)
    .then(games => {
        res.setHeader('Content-Type', 'application/json')
        res.json(games)
    })
});

router.get('/getAll', function(req, res, next) {

  db.getAllGames()
    .then(game => {
        res.setHeader('Content-Type', 'application/json')
        res.json(game)
    })
});

router.post('/add', function(req, res, next) {
  db.addGame(req.query.moves, req.query.winner)
  res.render('gameAdd');
});

module.exports = router;