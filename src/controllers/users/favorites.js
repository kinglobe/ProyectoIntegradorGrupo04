const toThousand = require('../../helpers/toThousand')
module.exports = (req,res) => {
    /* return res.send(req.session.userLogin.favorites) */
    return res.render('users/favorites',{
        favorites : req.session.userLogin.favorites,
        toThousand
    })
}
