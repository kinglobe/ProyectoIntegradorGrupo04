var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

const methodOverride = require('method-override');/* Se instalo method-override y lo traigo */
const session = require('express-session');/* Se instalo method-override y lo traigo */
const localsCheck = require('./middlewares/localsChechk');
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
const productRouter = require('./routes/product');
const infoRouter = require('./routes/info');
const cookieCheck = require('./middlewares/cookieCheck');
/* const cookieCheck = require('./middlewares/cookieCheck'); */

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, '..', 'public')));

app.use(methodOverride('_method')); /* Aqui lo llamo para usar y disfrasar la peticion que va por formulario */
app.use(session({
  secret : "aLmAcEnR",
  resave : true,
  saveUninitialized : true
}));

app.use(cookieCheck);
app.use(localsCheck);

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/products', productRouter);
app.use('/info',infoRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
