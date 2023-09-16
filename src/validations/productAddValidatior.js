const {check, body} = require('express-validator');


module.exports = [
    check('name')
        .notEmpty().withMessage('El nombre del producto es obligatorio'),
    check('brand')
        .notEmpty().withMessage('La marca es requerida'),
    check('categoryType')
        .notEmpty().withMessage('La categoria es requerida'),
    check('price')
        .notEmpty().withMessage('El precio es requerido').bail()
        .isDecimal().withMessage('El precio ingresado debe ser numerico'),
    check('description')
        .notEmpty().withMessage('Ingrese un descripcion').bail()
        .isLength({
            min : 20,
            max : 500
        }).withMessage('La descripcion debe contener entre 20 y 500 caracteres'),
    body('image')
        .custom((value,{req}) => {
            if (req.file) {
                return true
            }
            return false
        }).withMessage('No has subido ninguna imagen')
]
