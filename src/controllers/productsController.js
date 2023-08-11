module.exports = {
    products : (req,res) => {
        return res.render('products/detalleProducto')
    },
    carrito: (req,res) => {
        return res.render('products/carrito')
    }
}