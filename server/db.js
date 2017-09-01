var Sequelize = require('sequelize');

const db = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASS, {
  host: 'localhost',
  dialect: 'postgres',

  pool: {
    max: 5,
    min: 0,
    idle: 10000
  }
})

var Game

createTable = () => {

  Game = db.define('game', {
    moves: {
      type: Sequelize.STRING
    },
    x_wins: {
      type: Sequelize.BOOLEAN
    }
  })

  Game.sync({force: true})
    .then(() => {
    return Game.create({
      moves: '12634',
      x_wins: true
    })
  })

}

query = () => {

  Game.findAll()
    .then(games => {
      console.dir(games[0])
    })

}

module.exports = {
  db: db,
  createTable: createTable,
  query: query
}