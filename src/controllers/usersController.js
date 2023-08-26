const {readJSON} = require('../data')

module.exports = {
    registro : (req,res) => {
        return res.render('users/registro')
    },

    login : (req,res) => {
        return res.render('users/login')
    },

    admin: (req,res) => {
		const products = readJSON('products.json');

        return res.render('users/admin',{
            products
        });
    }
}