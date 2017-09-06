var express = require('express');
var router = express.Router();
var db = require('../db');

/* GET game. */
router.get('/', function(req, res, next) {

  db.getMoves(parseInt(req.query.gameID))
    .then(() => {
        res.send("OK")
    })
});

module.exports = router;