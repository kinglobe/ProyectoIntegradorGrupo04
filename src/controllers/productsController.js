const {readJSON} = require('../data');
const Product = require('../data/products');


const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");


module.exports = {
    detail : (req,res) => {
        const id = req.params.id;

		const products = readJSON('products.json');
        const product = products.find(product => product.id === id)
        return res.render('products/detalleProducto',{
            product
        })
    },


    carrito: (req,res) => {
        return res.render('products/carrito')
    },


    add: (req,res) => {
		const products = readJSON('products.json');

        return res.render('products/productAdd',{
            products
        })
    },


    create: (req, res) => {
		const products = readJSON('products.json');

        let newProducts = new Product(req.body);
        products.push(newProducts)

        return res.send(products);
    },


    edit: (req, res) => {
        return res.render('products/productEdit')
    },
    update : (req,res) => {
        return res.send(req.body)
    },


    remuve: (req, res) => {
        return res.render('products/productRemuve')
    }
}

