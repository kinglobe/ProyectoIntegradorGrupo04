const {existsSync,unlinkSync} = require('fs');
const {validationResult} = require ('express-validator');
const db = require('../../database/models');


module.exports = (req, res) => {


    const errors = validationResult(req);


    if (errors.isEmpty()) {

        const {name, price, discount, description, category, brand, section} = req.body

        db.Product.create({
            name: name.trim(),
            price,
            discount : discount || 0,
            description: description.trim(),
            categoryId: category,
            brandId: brand,
            sectionId: section
        })
            .then(product => {
                if (req.files.length) {
                    const images = req.files.map((file, index) => {
                        return {
                            file : file.filename,
                            main : index === 0 ? true : false,
                            productId : product.id,
                        }
                    })
                    db.Image.bulkCreate(images, {
                        validate : true
                    }).then(response => console.log(response))
                }
                return res.redirect('/admin');
            })
                .catch(error => console.log(error))
    
        
    }else {

        if (req.files.length) {
            req.files.forEach(file => {
                existsSync('./public/images' + file.filename) && unlinkSync('./public/images' + file.filename)
            })
            
        }

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
                    sections, 
                    errors: errors.mapped(),
                    old: req.body
                })
            })
            .catch(error => console.log(error))

    }


}