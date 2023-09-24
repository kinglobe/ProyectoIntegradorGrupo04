/* module.exports = (req,res) => {
    return res.send(req.body)
} 
 */

const { readJSON, writeJSON } = require('../../data');


module.exports = (req, res) => {

    const users = readJSON("users.json");
    const userId = req.session.userLogin.id;
    const {name, surname,gender, birthday} = req.body;
    console.log(userId);


    const usersModify = users.map(user =>{
        if( user.id === userId){
            return {
                ...user,
                name,
                surname,
                gender: req.body.gender? gender : user.gender,
                birthday: req.body.birthday? birthday: user.birthday
            }
        }
       return user
    });

    writeJSON(usersModify,'users.json');

    
    return res.redirect('profile')
}  

/*     if (!req.session.user) {
        return res.redirect('register');
    } else {
        const users = readJSON("users.json");

        const id = req.session.user.id;

        const userFind = users.find(user => user.id === id);

        const {name, surname, email, birthday} = req.body;
        userFind.name = name;
        userFind.surname = surname;
        userFind.email = email;
        userFind.birthday = birthday;

        writeJSON(users, 'users.json');

       return res.redirect('profile');
    } */
