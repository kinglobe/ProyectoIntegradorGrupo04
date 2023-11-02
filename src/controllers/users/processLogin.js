const { validationResult } = require('express-validator');
const db = require('../../database/models');


module.exports = (req, res) => {

  const errors = validationResult(req);
  const { email, remember } = req.body
  if (errors.isEmpty()) {
    db.User.findOne({
      where: {
        email
      }
    })
      .then(user => {
        req.session.userLogin = {
          id : user.id,
          name: user.name,
          rol: user.roleId
        }
        // tiempo de login 
        remember !== undefined && res.cookie('aLmAcEn', req.session.userLogin, {//
          maxAge: 1000 * 240
        })

        return res.redirect('/')
      })
      .catch(error => console.log(error))

  } else {
    return res.render('login', {
      errors: errors.mapped()
    })
  }

}
