const { check, body } = require('express-validator');


module.exports = [
    check('name')
        .notEmpty().withMessage('El nombre del producto es obligatorio'),
    check('category')
        .notEmpty().withMessage('La categoria es requerida'),
    check('brand')
        .notEmpty().withMessage('La marca es requerida'),
    check('section')
        .notEmpty().withMessage('La sección requerida'),
    check('price')
        .notEmpty().withMessage('El precio es requerido').bail()
        .isDecimal().withMessage('El precio ingresado debe ser numerico'),
    check('description')
        .notEmpty().withMessage('Ingrese un descripcion').bail()
        .isLength({
            min: 20,
            max: 1500
        }).withMessage('La descripcion debe contener entre 20 y 1500 caracteres'),
    body('images')
        .custom((value, { req }) => {
            if (req.files.length) {
                return true
            }
            return false
        }).withMessage('No has subido ninguna imagen')
]
