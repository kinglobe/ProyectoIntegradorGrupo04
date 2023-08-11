const express = require('express');
const router = express.Router();

const infoController = require('../controllers/infoControllers');

router.get('/condiciones', infoController.info);

module.exports = router;