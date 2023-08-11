module.exports = {
    registro : (req,res) => {
        return res.render('users/registro')
    },

    login : (req,res) => {
        return res.render('users/login')
    },

    admin: (req,res) => {
        return res.render('users/admin');
    }
}