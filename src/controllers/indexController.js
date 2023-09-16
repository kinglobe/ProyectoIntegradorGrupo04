const {readJSON} = require('../data');

const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");

module.exports = {
    index: (req, res) => {
		const products = readJSON('products.json');

        return res.render('index',{
			visited : products.filter(products => products.categoryDestacad === 'visited'),
			sale: products.filter(products => products.categoryDestacad === 'in-sale'),
			more: products.filter(products => products.categoryDestacad  === 'more-sale'),
			toThousand
			
			
			
			
		})
    },
	admin : (req,res) => { //se agrega admin para hacer el bloqueo en la busqueda directa

        
        const products = readJSON('products.json');
        
        return res.render('users/admin', {
            products,
            
        })
    }
}