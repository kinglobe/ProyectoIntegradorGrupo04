'use strict';

const estados = [
  {
    name: 'Open',
    createdAt: new Date,
    updatedAt: new Date
  },
  {
    name: 'Close',
    createdAt: new Date,
    updatedAt: new Date
  },

]

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {

    await queryInterface.bulkInsert('Statuses', estados, {});

  },

  async down(queryInterface, Sequelize) {

    await queryInterface.bulkDelete('Statuses', null, {});

  }
};
