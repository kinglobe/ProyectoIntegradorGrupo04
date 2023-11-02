var express = require('express');
var router = express.Router();
const {register, processRegister, login, processLogin, profile, updateProfile, logout} = require('../controllers/usersController');
const registerValidator = require('../validations/registerValidator');
const loginValidator = require('../validations/loginValidator');
const checkUserLogin = require('../middlewares/checkUserLogin');
const profileValidator = require('../validations/profileValidator');

/* /users */

router
.get('/register', register)
.post('/register',registerValidator, processRegister)

.get('/login', login)
.post('/login', loginValidator, processLogin)
.get('/profile', checkUserLogin, profile)
.put('/update', profileValidator, updateProfile)
.get('/logout', logout)


module.exports = router;

