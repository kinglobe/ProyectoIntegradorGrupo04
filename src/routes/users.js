var express = require('express');
var router = express.Router();
const {register, processRegister, login, processLogin, profile, updateProfile, admin, logout} = require('../controllers/usersController');
const registerValidator = require('../validations/registerValidator');
const loginValidator = require('../validations/loginValidator');
const checkUserLogin = require('../middlewares/checkUserLogin');

/* /users */

router
.get('/register', register)
.post('/register',registerValidator, processRegister)

.get('/login', login)
.post('/login', loginValidator, processLogin)
.get('/profile', checkUserLogin, profile)
.put('/update', updateProfile)
.get('/admin',  admin)
.get('/logout', logout)


module.exports = router;

