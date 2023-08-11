module.exports = {
    products : (req,res) => {
        return res.render('products/detalleProducto')
    },
    carrito: (req,res) => {
        return res.render('products/carrito')
    },

    add: (req,res) => {
        return res.render('products/productAdd')
    },
    edit: (req, res) => {
        return res.render('products/productEdit')
    }
}