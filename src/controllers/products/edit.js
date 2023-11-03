const db = require('../../database/models')

module.exports = (req,res) => {

    const product = db.Product.findByPk(req.params.id, {
        include: ['images']
    })

    const categories = db.Category.findAll({
        order: ['name']
    })
    
    const brands = db.Brand.findAll({
        order : ['name']
    });

    const sections = db.Section.findAll({
        order: ['name']
    })

    Promise.all([product, categories, brands, sections])
        .then(([product, categories, brands, sections]) => {
            return res.render('products/productEdit',{
                ...product.dataValues,
                categories,
                brands,
                sections
            })
        })
        .catch(error => console.log(error))

    
}