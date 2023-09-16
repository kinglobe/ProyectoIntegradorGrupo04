const {existsSync,unlinkSync} = require('fs');
const {validationResult} = require ('express-validator');
const {readJSON, writeJSON} = require('../../data');
const Product = require('../../data/products');


module.exports = (req, res) => {

    const errors = validationResult(req);
    

    if (errors.isEmpty()) {
        const products = readJSON('products.json');

        let newData =  {
            ...req.body,
            image: req.file ? req.file.filename : null
        }
    
        let newProducts = new Product(newData);
        products.push(newProducts);
    
        writeJSON(products, 'products.json')
    
        return res.redirect('/users/admin');
    }else {

        if (req.file) {
            existsSync('./public/images' + req.file.filename) && unlinkSync('./public/images' + req.file.filename)
        }

        const products = readJSON('products.json');

        return res.render('products/productAdd',{
            products,
            errors : errors.mapped(),
            old : req.body
        })

    }


}