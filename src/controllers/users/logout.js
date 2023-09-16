module.exports = (req,res) => {
    req.session.destroy();
    res.cookie('aLmAcEn',null,{
        maxAge : -1
    })
    return res.redirect('/')
}