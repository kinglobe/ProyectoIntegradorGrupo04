'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
<<<<<<< HEAD
      User.belongsToMany(models.Product,{
        as : 'favorites',
        foreignKey : 'userId',
        otherKey : 'productId',
        through : 'Favorites'
=======
      // define association here
      User.hasOne(models.Address,{
        as:"address",
        foreignKey:"userId"
        
      })
      User.belongsTo(models.Role,{
        as:"role",
        foreignKey:"roleId"
>>>>>>> 97a36a2f33b3f6b8df8fb26cbe691c5699c08216
      })
    }
  }
  User.init({
    name: DataTypes.STRING,
    surname: DataTypes.STRING,
    email: DataTypes.STRING,
    password: DataTypes.STRING,
    image: DataTypes.STRING,
    gender : DataTypes.STRING,
    birthday : DataTypes.DATE,
    about : DataTypes.TEXT,
    roleId: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'User',
  });
  return User;
};