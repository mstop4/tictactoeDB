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
    x_wins: {
      type: Sequelize.BOOLEAN
    }
  })

  return Games.sync({force: newTable})
}

addGame = (moves, x_wins) => {
  return Games.create({
      moves: moves,
      x_wins: x_wins
  })
}

queryGames = () => {
  return Games.findAll()
    .then(games => {
      console.dir(games)
  })
}

getMoves = (gameNum) => {
  return Games.findAll()
    .then(games => {
      if (games[gameNum]) {
        console.dir(games[gameNum].dataValues.moves)
      } else {
        console.log("No game found.")
      }
  })
}

module.exports = {
  db: db,
  useTable: useTable,
  addGame: addGame,
  queryGames: queryGames,
  getMoves: getMoves
}