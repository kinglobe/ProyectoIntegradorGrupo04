const express = require('express');
const { checkEmail, toggleFavorite } = require('../controllers/apiController');
const router = express.Router();

/* / Llegamos como apis */
router.get('/check-email', checkEmail);

router.get('/toggle-favorite',toggleFavorite)


module.exports = router;
