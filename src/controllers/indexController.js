const {readJSON} = require('../data');

const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");

module.exports = {
    index: (req, res) => {
		const products = readJSON('products.json');

        return res.render('index',{
			products/* ,
			visited : products.filter(products => products.category-dest === 'visited'),
			sale: products.filter(products => products.category-dest === 'in-sale'),
			more: products.filter(products => products.category-dest === 'more-sale'),
			toThousand  */
		})
    }
}