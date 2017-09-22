var express = require('express');
var router = express.Router();
var db = require('../lib/dbHelpers');

/* GET game. */



router.get('/recent/:format', function(req, res, next) {

  let number

  if (!req.query.number) {
    number = 10
  } else {
    number = req.query.number
  }

  db.getMostRecentGames(number)
    .then(games => {

      if (req.params.format === "html") {

        // Send HTML
        res.render('gamesRecent', {
          games: games,
          number: number
        })

      } else if (req.params.format === "json") {

        // Send JSON
        res.setHeader('Content-Type', 'application/json');

        if (games.length > 0) {
          res.send(JSON.stringify(games))
        } else {
          res.send(JSON.stringify([{error: "NO RESULTS"}]))
        }

      } else {
        res.send("Unknown format.")
      }
    })
});

router.get('/search/:format', function(req, res, next) {

  db.searchGames(req.query.moves, req.query.winner)
    .then(games => {

      if (req.params.format === "html") {

        // Send HTML
        let sMoves = req.query.moves ? req.query.moves : "Any"
        let sWinner = req.query.winner ? req.query.winner : "Any"

        res.render('gameIndex', {
          games: games,
          moves: sMoves,
          winner: sWinner,
        })

      } else if (req.params.format === "json") {

        // Send JSON
        res.setHeader('Content-Type', 'application/json');

        if (games.length > 0) {
          res.send(JSON.stringify(games))
        } else {
          res.send(JSON.stringify([{error: "NO RESULTS"}]))
        }

      } else {
        res.send("Unknown format.")
      }
    })
});

router.get('/:id/:format', function(req, res, next) {

  db.findGame(parseInt(req.params.id))
    .then(game => {

      if (req.params.format === "html") {

        // Send HTML
        if (game) {
          res.render('gameInfo', {game: game.dataValues})
        } else {
          res.render('gameInfo', {game: null})
        }

      } else if (req.params.format === "json") {

        // Send JSON
        res.setHeader('Content-Type', 'application/json')

        if (game) {
          res.send(JSON.stringify(game.dataValues))
        } else {
          res.send(JSON.stringify({error: "NO RESULTS"}))
        }

      } else {
        res.send("Unknown format.")
      }
    })
});

router.post('/add', function(req, res, next) {
  db.addGame(req.query.moves, req.query.winner)
  res.send("Game Added!")
});

router.delete('/all', function(req, res, next) {
  db.clearGames()
  res.send("Games Cleared!")
})

module.exports = router;