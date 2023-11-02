const db = require('../../database/models')

module.exports = (req,res) => {

    const categories = db.Category.findAll({
        order: ['name']
    })
    
    const brands = db.Brand.findAll({
        order : ['name']
    });

    const sections = db.Section.findAll({
        order: ['name']
    })

    Promise.all([categories, brands, sections])
        .then(([categories, brands, sections]) => {
            return res.render('products/productAdd',{
                categories,
                brands,
                sections
            })
        })
        .catch(error => console.log(error))

    
}