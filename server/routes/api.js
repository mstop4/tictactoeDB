var express = require('express');
var router = express.Router();
var db = require('../db');

/* GET game. */
router.get('/getMoves', function(req, res, next) {

  db.getMoves(parseInt(req.query.gameID))
    .then(game => {
      res.json(game.dataValues)
    })
});

router.get('/getAll', function(req, res, next) {

  db.queryGames()
    .then(game => {
        res.setHeader('Content-Type', 'application/json')
        res.json(game)
    })
});

router.post('/add', function(req, res, next) {
  db.addGame(req.query.moves, req.query.winner)
  res.send("OK");
});

module.exports = router;