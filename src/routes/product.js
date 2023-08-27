var express = require('express');
var router = express.Router();
const {detail, carrito, add, edit, create, update, remove} = require('../controllers/productsController')
/* /products */
router.get('/detalleProducto/:id', detail);
router.get('/carrito', carrito);
router.get('/productAdd', add);
router.post('/productAdd', create)
router.get('/productEdit/:id', edit);
router.put('/update/:id', update);
router.delete('/remove/:id', remove);





module.exports = router;
