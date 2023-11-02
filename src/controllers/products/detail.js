const db = require('../../database/models');
const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");

/* module.exports = (req, res) => {

    db.Product.findByPk(req.params.id, {
        include: ['images']
    })
    const categories = db.Category.findAll({
        order: ['name']
    })

    Promise.all([product, categories])
        .then(([product, categories]) => {

            return res.render('products/detalleProducto', {
                ...product,
                categories,
                toThousand
            })
        })
        .catch(error => console.log(error))



 */
 /*        module.exports = (req, res) => {

            const product = db.Product.findByPk(req.params.id, {
                include: ['category', 'brand', 'section', 'images']
            });
        
            const categories = db.Category.findAll({
                order: ['name']
            });
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
        
            Promise.all([product, categories, sections])
                .then(([product, categories, sections]) => {
                    return res.render('products/detalleProducto', {
                        product,
                        categories,
                        sections,
                        toThousand
                    });
                })
                .catch(error => console.log(error));
        }
 */

/* } */

module.exports = (req, res) => {

    const product = db.Product.findByPk(req.params.id, {
        include: ['category', 'brand', 'section', 'images']
    });

    const categories = db.Category.findAll({
        order: ['name']
    });

    const sections = db.Section.findAll({
        include: [{
            association: 'products',
            include: [{
                all: true
            }]
        }]
    });

    Promise.all([product, categories, sections])
        .then(([product, categories, sections]) => {
            const destacadosSection = sections.find(section => section.name === 'Productos Destacados');

            return res.render('products/detalleProducto', {
                product,
                categories,
                sections: destacadosSection,
                toThousand
            });
        })
        .catch(error => console.log(error));
}