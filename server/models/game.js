'use strict';
module.exports = function(sequelize, DataTypes) {
  var Game = sequelize.define('Game', {
    moves: DataTypes.STRING,
    winner: DataTypes.CHAR(1),
    timesPlayed: DataTypes.INTEGER
  }, {
    classMethods: {
      associate: function(models) {
        // associations can be defined here
      }
    }
  });
  return Game;
};