const {readJSON, writeJSON} = require('../data');
const Product = require('../data/products');


const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");


module.exports = {
    detail : require('./products/detail'),
    carrito: require('./products/carrito'),
    add: require('./products/add'),
    create: require('./products/create'),
    edit: require('./products/edit'),
    update : require('./products/update'),
    remove: require('./products/remove')
}

