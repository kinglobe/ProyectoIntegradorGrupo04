module.exports = (req,res,next) => {
    if(req.cookies.aLmAcEn){
        req.session.userLogin = req.cookies.aLmAcEn
    }
    next()
}