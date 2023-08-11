var express = require('express');
var router = express.Router();
const registroController = require('../controllers/usersController')
 


router.get('/registro', registroController.registro);

router.get('/login', registroController.login);



module.exports = router;

