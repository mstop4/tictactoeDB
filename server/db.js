var Sequelize = require('sequelize');

const db = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASS, {
  host: 'localhost',
  dialect: 'postgres',
  define: {
    timestamps: false
  },

  pool: {
    max: 5,
    min: 0,
    idle: 10000
  }
})

var Games

useTable = (newTable) => {
  Games = db.define('game', {
    moves: {
      type: Sequelize.STRING
    },
    winner: {
      type: Sequelize.CHAR(1)
    }
  })

  return Games.sync({force: newTable})
}

addGame = (moves, winner) => {
  return Games.create({
      moves: moves,
      winner: winner.toUpperCase()
  })
}

getAllGames = () => {
  return Games.findAll()
}

searchGames = (moves, winner) => {

  let sMoves = moves ? moves : ""
  let sWinner = winner ? winner : "%"

  return Games.findAll({
    where: {
      moves: { $ilike: sMoves + "%" },
      winner: { $ilike: sWinner.toUpperCase() }
    }
  })
}

findGame = (gameNum) => {
  return Games.findById(gameNum)
}

module.exports = {
  db: db,
  useTable: useTable,
  addGame: addGame,
  getAllGames: getAllGames,
  searchGames: searchGames,
  findGame: findGame
}