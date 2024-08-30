const express = require("express");
const router = express.Router();
const fs = require("fs");
const bcrypt = require("bcrypt");
// var session = require('express-session');
const path = require('path');
const app = express();
var session = require('express-session');

const Handlebars = require('handlebars');
Handlebars.registerHelper('eq', function(a, b) {
  return a === b;
});
//Duong dẫn tĩnh
router.use(express.static("public/images/poster/"));
router.use(express.static("public/movie/"));
router.use(express.static("../public/images/poster/"));
router.use(express.static("../../public/movie/"))

const { db } = require("../app");

// Trang chủ
router.get("/", (req, res) => {
  res.render("main");
});
// Trang đăng nhập
router.get("/login", function (req, res) {
  res.render("pages/login");
});
// Trang đăng ký
router.get("/signup", function (req, res) {
  res.render("pages/signup");
});
//zz


// Load movie
router.get("/dashboard", async (req, res) => {
  try {
    const search = req.query.search ?? "";
    const type = req.query.type ?? "";
    const year = req.query.year ?? "";
    const country = req.query.country ?? "";
    const movies = await getdata(
      `select * from movie where 
        title_movie like '%${search}%' and id_type_movie like '%${type}%'
        and release_year like '%${year}%' and country like '%${country}%'
        `
    );
    const types = await getdata("select * from type_movie");
    const email = req.session.email;
    const loggedin = req.session.loggedin;

    res.render("../views/pages/dashboard.hbs", { movies, types,email,loggedin });
  } catch (error) {
    res.send(error);
  }
});



// Xử lý đăng nhập --Hàm còn sai để tượng trưng
router.post("/login", (req, res) => {
  const { email, password } = req.body;

  if (email == "" && password == "") {
    res.send("Please enter Username and Password!");
    res.end();
  } else {
    db.query(
      "SELECT password FROM account WHERE email = ?",
      [email],
      function (error, results, fields) {
        if (results.length > 0) {
          const hash = results[0].password;
          bcrypt.compare(password, hash, (err, result) => {
            if (err) {
              return;
            } else if (result) {
              console.log("Password is correct");
              loggedin=true;
              req.session.loggedin = loggedin;
              req.session.email = email;
             res.redirect("dashboard");
              
            } else {
              // res.flash('error', 'An error occurred. Please try again later.');
            }
          });
          // res.redirect("/dashboard");
        } else {
          res.send("người dùng không tồn tại");
        }
      }
    );
  }
});

// Xử lý đăng ký --Hàm còn sai để tượng trưng
router.post("/signup", (req, res) => {
  const { username, password, email, confirm_password } = req.body;
  const id_type =2;
  if (
    username == "" ||
    email == "" ||
    password == "" ||
    confirm_password == ""
  ) {
    res.status(400).json({ message: "Please enter all required fields" });
    return;
  }

  if (password !== confirm_password) {
    res
      .status(400)
      .json({ message: "Password and confirm password do not match" });
    return;
  }

  db.query("SELECT * FROM `account` WHERE email=?", email, (err, result) => {
    if (result.length > 0) {
      res.status(500).json({ message: "account exits" });
      return;
    } else {
      bcrypt.hash(password, 10, (err, hash) => {
        if (err) {
          res.status(500).json({ message: "Internal server error" });
          return;
        }
        const account = { id_type,username, password: hash, email };

        db.query("INSERT INTO account SET ?", account, (err, result) => {
          if (err) {
            return res.status(500).json({ message: "Internal server error" });
          }
          res.redirect("/dashboard");
        });
      });
    }
  });
});

// Đăng xuất
router.get("/logout", (req, res) => {
  req.session.destroy();
  res.redirect("/login");
});

const getdata = (query) => {
  return new Promise((resolve, reject) => {
    db.query(query, (err, result) => {
      if (err) return reject(err);
      return resolve(result);
    });
  });
};



router.get("/dashboard/detail/:id", (req, res) => {

  var id_movie = req.params.id;
  db.query("SELECT * FROM movie WHERE id_movie=?", id_movie, (err, result) => {
    if (err) throw err;
    res.render("../views/pages/detail.hbs", { detailMovie: result});
  });
  // res.render('../views/pages/detail.hbs')
});

// admin account
//get data account
router.get('/account', (req, res) => {
  db.query('SELECT * FROM account', (err, results) => {
      if (err) throw err;
      res.render('pages/admin/account', { accounts: results });
  });
});
//admin thêm acccout
router.post('/account', (req, res) => {
  const { username, password, email} = req.body;//sữa thêm chổ này
  //viết sql ở đây
  const id_type =2;
  if (
    username == "" ||
    email == "" ||
    password == "" 
  ) {
    res.status(400).json({ message: "Please enter all required fields" });
    return;
  }

  db.query("SELECT * FROM `account` WHERE email=?", email, (err, result) => {
    if (result.length > 0) {
      res.status(500).json({ message: "account exits" });
      return;
    } else {
      bcrypt.hash(password, 10, (err, hash) => {
        if (err) {
          res.status(500).json({ message: "Internal server error" });
          return;
        }
        const account = { id_type,username, password: hash, email };

        db.query("INSERT INTO account SET ?", account, (err, result) => {
          if (err) {
            return res.status(500).json({ message: "Internal server error" });
          }
          res.redirect("/account");
        });
      });
    }
  });
});


//delete account succsecer
router.get('/account/delete/:id_account', (req, res) => {
  var id_account = req.params.id_account;
  db.query("DELETE FROM account WHERE id_account = ?", id_account, (err, result) => {
    if (err) throw err;
    res.redirect("/account");
  });

});


//edit accout
router.get('/account/edit/:id_account', (req, res) => {
  var id_account = req.params.id_account;
  db.query("SELECT * FROM account WHERE id_account=?", id_account, (err, result) => {
    if (err) throw err;
    res.render("../views/pages/admin/editAccount.hbs",{inf:result});
  });
  
});
//update 
router.post('/account/update', (req, res) => {
  const { id_account,username, password, email} = req.body
  db.query("UPDATE account SET username='"+username+"',password='"+password+"',email='"+email+"' WHERE id_account=?", id_account, (err, result) => {
    if (err) throw err;
    res.redirect("/account");
  });
  
});


// admin movie
router.get('/movie', (req, res) => {
  db.query('SELECT * FROM movie', (err, results) => {
      if (err) throw err;
      res.render('pages/admin/movie', { movies: results });
  });
});

//add phim
router.post('/movie', (req, res) => {
  //viết code sql ở đây
});

//xoá video
router.get('/movie/delete/id_movie', (req, res) => {
  var id_movie = req.params.id_movie;
});

//edit video
router.get('/movie/edit/id_movie', (req, res) => {
  var id_movie = req.params.id_movie;
  //viết code sql ở đây
});

module.exports = router;
