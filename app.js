const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const session = require("express-session");
const exphbs = require("express-handlebars");
const movieRoute = require("./routes/movie");
const path = require("path");

//Thiết lập kết nối đếm Xampp
const mysql = require("mysql");
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "flitnet",
});
db.connect((err) => {
  if (err) throw err;
  console.log("Connected to MySQL database!");
});
app.use(function (req, res, next) {
  res.locals.db = db;
  next();
});
module.exports.db = db;

// Set up handlebars view engine
app.engine(
  ".hbs",
  exphbs.engine({
    extname: ".hbs",
    defaultLayout: "main",
    layoutsDir: path.join(__dirname, "views/"),
  })
);

app.set("view engine", "hbs");

app.set("views", path.join(__dirname, "views"));

// Define routes
app.get("/", (req, res) => {
  res.render("main", { title: "Home Page" });
});

// Thiết lập middleware
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(
  session({
    secret: "secret",
    resave: false,
    saveUninitialized: false,
  })
);

// Khai báo routes
const mainRoutes = require("./routes/main");
app.use("/", mainRoutes);
app.use("/movie", movieRoute);

// const movieRoutes = require('./routes/movie');
// app.use('/', movieRoutes);

// Khởi động server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
});
