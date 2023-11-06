const db = require('../database/models');
const {Op} = require('sequelize')
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
		const sections = db.Section.findAll({
			order: ['name']
		})
	
        
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

		const keywords = req.query.keywords

        db.Product.findAll({
			where : {
				name: {
					[Op.substring]: keywords
				}
			}
		})
			.then(results => {
				return res.render('results',{
					results,
					toThousand,
					keywords
				})
			}).catch(error => console.log(error))
		
	},
}