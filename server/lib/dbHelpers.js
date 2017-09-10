var db = require('../models');
var Game = db.Game;

addGame = (moves, winner) => {

  // findOrCreate is bugged in Sequelize 4.8.0 + pg 7.2.0

  Game.findOne({
    where: {
      moves: moves,
      winner: winner.toUpperCase()
    }
  })
  .then(game => {
    // if game exists, update it
    if (!game) {
      return Game.create({
        moves: moves,
        winner: winner.toUpperCase()
      })
    // else update
    } else {
      return Game.update({
        moves: moves,
        winner: winner.toUpperCase()
      },
      {
        where: {
          id: game.dataValues.id
        }
      })
    }
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