const { validationResult } = require('express-validator');
const db = require('../../database/models');
const product = require('../../database/models/product');


module.exports = (req, res) => {

  const errors = validationResult(req);
  const { email, remember } = req.body
  if (errors.isEmpty()) {
    db.User.findOne({
      where: {
        email
      },
      include : ['favorites']
    }).then(user => {
        req.session.userLogin = {
          id : user.id,
          name: user.name,
          rol: user.roleId,
          favorites : user.favorites
        }
        // tiempo de login 
        remember !== undefined && res.cookie('aLmAcEn', req.session.userLogin, {//
          maxAge: 1000 * 240
        })

        /* carrito */
        db.Order.findOne({
          where : {
            userId : user.id,
            statusId : 1
          },
          include : [
            {
              association : 'items',
              include : {
                association : 'product',
              
              }

          }
          ]
        }).then( order => {
          if(order){
            req.session.cart = {
              orderId : order.id,
              products : order.items.map(({quantity,product: {id,name,image,price,discount}})=> {
                return{
                  id,
                  name,
                  image,
                  price,
                  discount,
                  quantity,
                }
              }),
              total : order.items.map(items => items.product.price * items.quantity).reduce((a, b) => a+b, 0)
                }

             

              return res.redirect('/')
              
          
          }else{
            db.Order.create({
              total : 0,
              userId : user.id,
              statusId : 1
              
            }).then(order => {
              req.session.cart = {
                orderId : order.id,
                products : [],
                total : 0,
            }
            console.log(req.session.cart);
             return res.redirect('/')
            })
          }
        })

       
      })
      .catch(error => console.log(error))

  } else {
    return res.render('login', {
      errors: errors.mapped()
    })
  }

}

