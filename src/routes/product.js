var express = require('express');
var router = express.Router();
const {detail, carrito, add, edit, create, update} = require('../controllers/productsController')
/* /products */
router.get('/detalleProducto/:id', detail);
router.get('/carrito', carrito);
router.get('/productAdd', add);
router.post('/productAdd', create)
router.get('/productEdit/:id', edit);
router.put('/update/:id', update)





module.exports = router;
