'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    
      await queryInterface.bulkInsert('Users',
      [
        {
        name: 'Admin',
        surname: 'Almacen',
        email : 'admin@gmail.com',
        password : "$2a$10$rp6kJ76QSkFRDR7OhE6Gse.HTXWTD9q2lbnuv//Ag6TbG//MjJ1Mi",
        image : null,
        roleId : 1,
        createdAt : new Date,
        updatedAt : new Date
      },
      {
        name: 'User',
        surname: 'Almacen',
        email : 'user@gmail.com',
        password : "$2a$10$ITSbKT5b8t96EUNxpE9nxOIXPvHZMqZddWy4mTjQkVlul0uqN/ezW",
        image : null,
        roleId : 2,
        createdAt : new Date,
        updatedAt : new Date
      },
    ], {});
    
  },

  async down (queryInterface, Sequelize) {
    
    
      await queryInterface.bulkDelete('Users', null, {});
    
  }
};
