const {unlinkSync, existsSync} = require('fs');
const { readJSON, writeJSON } = require("../../data");

module.exports = (req,res) => {

    const products = readJSON('products.json');

    const id = req.params.id;
    const {name,brand,description,categoryType,price,discount,stock}= req.body;

    const productsModify = products.map(product => {

        if (product.id === id) {


            req.file && (existsSync(`./public/images/products/${product.image}`) && unlinkSync(`./public/images/products/${product.image}`))


            product.name = name.trim();
            product.brand = brand.trim();
            product.description = description.trim();
            product.categoryType = categoryType.trim();
            product.price = +price;
            product.discount = +discount;
            product.stock = +stock; 
            product.image = req.file ? req.file.filename : product.image;
            product.createdAt = new Date();           
        }

        return product
    });

    writeJSON(productsModify, 'products.json')

    return res.redirect('/users/admin')
}