const db = require("../../database/models");

module.exports= (req,res) => { 

    const products = db.Product.findAll({
        include: ['category', 'brand', 'section', 'images'],
        where : {
            categoryId : req.query.category
        }
    });
    const categories = db.Category.findAll({
        order: ['name']
    })
    

    Promise.all([products,categories])
        .then(([products,categories]) => {
            
            return res.render('admin', {
                products,
                categories,
                category: req.query.category
            })
        })
        .catch(error => console.log(error))
    
    
}