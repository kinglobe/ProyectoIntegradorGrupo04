const {readJSON, writeJSON} = require('../../data');
const Product = require('../../data/products');


module.exports = (req, res) => {
    const products = readJSON('products.json');

    let newProducts = new Product(req.body);
    products.push(newProducts);

    writeJSON(products, 'products.json')

    return res.redirect('/users/admin');
}