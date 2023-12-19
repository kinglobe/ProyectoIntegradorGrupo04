'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    
      await queryInterface.bulkInsert('Addresses',
      [
        {
        address: null,
        city: null,
        province : null,
        userId : 1,
        createdAt : new Date,
        updatedAt : new Date
      },
      {
        address: null,
        city: null,
        province : null,
        userId : 2,
        createdAt : new Date,
        updatedAt : new Date
      },
    ], {});
    
  },

  async down (queryInterface, Sequelize) {
    
    
      await queryInterface.bulkDelete('Addresses', null, {});
    
  }
};
