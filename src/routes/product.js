var express = require('express');
var router = express.Router();
const multer = require('multer');

const {detail, carrito, add, edit, create, update, remove} = require('../controllers/productsController');
const { upload } = require('../middlewares/upload');
/* /products */
router.get('/detalleProducto/:id', detail);
router.get('/carrito', carrito);
router.get('/productAdd', add);
router.post('/productAdd',upload.single('image'), create)
router.get('/productEdit/:id', edit);
router.put('/update/:id', upload.single('image'),update);
router.delete('/remove/:id', remove);





module.exports = router;
