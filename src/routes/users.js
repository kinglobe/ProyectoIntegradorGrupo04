var express = require('express');
var router = express.Router();
const usersController = require('../controllers/usersController')
 


router.get('/registro', usersController.registro);

router.get('/login', usersController.login);

router.get('/admin', usersController.admin);



module.exports = router;

