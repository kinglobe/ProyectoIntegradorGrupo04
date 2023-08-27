const { readJSON, writeJSON } = require("../../data");

module.exports = (req,res) => {
    const products = readJSON('products.json');

    return res.render('products/productAdd',{
        products
    })
}