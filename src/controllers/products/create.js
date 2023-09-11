const {readJSON, writeJSON} = require('../../data');
const Product = require('../../data/products');


module.exports = (req, res) => {
    const products = readJSON('products.json');

    let newData =  {
        ...req.body,
        image: req.file ? req.file.filename : null
    }

    let newProducts = new Product(newData);
    products.push(newProducts);

    writeJSON(products, 'products.json')

    return res.redirect('/users/admin');
}