var express = require('express');
var router = express.Router();
const multer = require('multer');

const {detail, carrito, add, edit, create, update, remove, filter} = require('../controllers/productsController');
const { upload } = require('../middlewares/upload');
const productAddValidatior = require('../validations/productAddValidatior');


/* /products */
router.get('/detalleProducto/:id', detail);
router.get('/carrito', carrito);
router.get('/productAdd', add);
router.post('/productAdd',upload.fields([
    {
        name: "image",
    },
    {
        name: "images",
    }
]),productAddValidatior, create)
router.get('/productEdit/:id', edit);
router.put('/update/:id', upload.fields([
    {
        name: "image",
    },
    {
        name: "images",
    }
]),update);
router.delete('/remove/:id', remove);
router.get('/filter',filter)





module.exports = router;
