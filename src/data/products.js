const {v4 : uuidv4} = require('uuid');

const Product = function({name, brand, categoryType, price, discount, image, description}){
    this.id = uuidv4();
    this.name = name.trim();
    this.brand = brand.trim();
    this.categoryType = categoryType.trim();
    this.price = +price;
    this.discount = +discount;
    this.image = image;
    this.description = description.trim();
    this.creatAt = new Date();
}

module.exports = Product;