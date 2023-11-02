const db = require('../database/models');

const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");



module.exports = {
    index: (req, res) => {
		const sections = db.Section.findAll({
			include : [
				{
					association : 'products',
					include : [
						{
							all : true
						}
					]
				}
			]
		})
		Promise.all([sections])
			.then(([sections]) => {
				//return res.send(sections)
				return res.render('index',{
					sections,
					toThousand
					
				})
			}).catch(error => console.log(error))
	},
/* -------------------------------------------------------------- */

	admin : (req,res) => { 

        
        const products = db.Product.findAll({
			include: ['category', 'brand', 'section', 'images']
		});
		const categories = db.Category.findAll({
			order: ['name']
		})
		

		Promise.all([products,categories, sections])
			.then(([products,categories,sections]) => {
				
				return res.render('admin', {
					products,
					categories,
					sections
				})
			})
			.catch(error => console.log(error))
	},
        
/* ------------------------------------------------------------------------------------------------ */



    search: (req, res) => {
        const products = readJSON('products.json');
		const keywords = req.query.keywords
		const results = products.filter(product=> product.name.toLowerCase().includes(keywords.toLowerCase()))
		return res.render('results',{
			results,
			toThousand,
			keywords
		})
	},
}