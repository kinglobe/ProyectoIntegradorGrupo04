var express = require('express');
var router = express.Router();
const {registro, login, admin} = require('../controllers/usersController')
 
/* /users */

router.get('/registro', registro);

router.get('/login', login);

router.get('/admin', admin);



module.exports = router;

