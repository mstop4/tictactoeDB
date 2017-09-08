var db = require('../models');
var Game = db.Game;

addGame = (moves, winner) => {
  return Game.create({
      moves: moves,
      winner: winner.toUpperCase()
  })
}

getAllGames = () => {
  return Game.findAll()
}

searchGames = (moves, winner) => {

  let sMoves = moves ? moves : ""
  let sWinner = winner ? winner : "%"

  return Game.findAll({
    where: {
      moves: { $ilike: sMoves + "%" },
      winner: { $ilike: sWinner.toUpperCase() }
    }
  })
}

findGame = (gameNum) => {
  return Game.findById(gameNum)
}

module.exports = {
  addGame: addGame,
  getAllGames: getAllGames,
  searchGames: searchGames,
  findGame: findGame
}