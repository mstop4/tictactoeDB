var express = require('express');
var router = express.Router();
var db = require('../db');

/* GET game. */
router.get('/one', function(req, res, next) {

  db.getMoves(parseInt(req.query.gameID))
    .then(game => {
        res.setHeader('Content-Type', 'application/json')
        res.json(game)
    })
});

router.get('/all', function(req, res, next) {

  db.queryGames()
    .then(game => {
        res.setHeader('Content-Type', 'application/json')
        res.json(game)
    })
});

router.post('/', function(req, res, next) {
  db.addGame(req.query.moves, req.query.winner)
  res.send("OK");
});

module.exports = router;