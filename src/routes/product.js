var express = require('express');
var router = express.Router();
const productController = require('../controllers/productsController')
/* / */
router.get('/detalleProducto', productController.products);
router.get('/carrito', productController.carrito);
router.get('/productAdd', productController.add);
router.get('/productEdit', productController.edit);





module.exports = router;
