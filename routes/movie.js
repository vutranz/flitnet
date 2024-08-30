const express = require("express");
const router = express.Router();
const db = require("../config/db");

router.get("/index", (req, res) => {
  res.render("pages/index");
});

router.get("/", (req, res) => {
  db.query("SELECT * FROM movie", (err, results) => {
    if (err) throw err;
    res.render("movie", { movies: results });
  });
});

module.exports = router;
