/**
 * Module dependencies.
 */
var express = require('express'),
    routes = require('./routes'),
    user = require('./routes/user'),
    company = require('./routes/company'),
    job = require('./routes/job'),
    search = require('./routes/search'),
    http = require('http'),
    SqlString = require('sqlstring'),
    path = require('path');
//var methodOverride = require('method-override');
var session = require('express-session');
var app = express();
var mysql = require('mysql');
var bodyParser = require("body-parser");
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'demo'
});

connection.connect();

global.db = connection;
global.SqlString = SqlString;
// all environments
app.set('port', process.env.PORT || 8080);
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({
    extended: false
}));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true,
    cookie: {
        maxAge: 60000
    }
}))

//Simple log
app.use((req, res, next) => {
    var now = new Date().toString();
    var log = `${now}: ${req.method} ${req.url}`;

    console.log(log);
    next();
});

app.get('/', company.db); //call for da post 

// development only

//-------------------------------------------------Signup page------------------------------------------------------------
app.get('/signup', user.signup); //call for signup page
app.post('/signup', user.signup); //call for signup post 

//-------------------------------------------------Login page------------------------------------------------------------
app.get('/login', user.login); //call for login page
app.post('/login', user.login); //call for login post

//-------------------------------------------------After Login page------------------------------------------------------------
app.get('/dashboard', user.dashboard); //call for dashboard page after login
app.get('/logout', user.logout); //call for logout
app.get('/profile', user.profile); //to render users profile

//-------------------------------------------------Company page------------------------------------------------------------
app.get('/company/:companyName', company.profile); //call for company profile
app.get('/company', company.company); //call for company list page

//-------------------------------------------------Search page------------------------------------------------------------
app.post('/search', search.search);
app.get('/search', search.search);


app.get('/job', job.job); //call for job page
//Middleware
app.listen(8080);