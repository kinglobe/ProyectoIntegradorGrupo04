const { readJSON, writeJSON } = require("../../data");

module.exports = (req,res) => {

    const products = readJSON('products.json');

    const id = req.params.id;
    const {name,brand,description,categoryType,price,discount,stock}= req.body;

    const productsModify = products.map(product => {

        if (product.id === id) {
            product.name = name.trim();
            product.brand = brand.trim();
            product.description = description.trim();
            product.categoryType = categoryType.trim();
            product.price = +price;
            product.discount = +discount;
            product.stock = +stock; 
            product.createdAt = new Date();           
        }

        return product
    });

    writeJSON(productsModify, 'products.json')

    return res.redirect('/users/admin')
}