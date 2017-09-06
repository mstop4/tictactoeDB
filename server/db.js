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

  Games.sync({force: newTable})
}

addGame = (moves, x_wins) => {
  Games.create({
      moves: moves,
      x_wins: x_wins
  })
}

queryGames = () => {
  Games.findAll()
    .then(games => {
      console.dir(games)
    })
}

module.exports = {
  db: db,
  useTable: useTable,
  addGame: addGame,
  queryGames: queryGames
}