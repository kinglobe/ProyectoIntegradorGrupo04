'use strict';

const categories = [
  {
    name: 'Alfajores',
    createdAt: new Date,
    updatedAt: new Date
  },
  {
    name: 'Vinos',
    createdAt: new Date,
    updatedAt: new Date
  },
  {
    name: 'Yerbas',
    createdAt: new Date,
    updatedAt: new Date
  },
]

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {

    await queryInterface.bulkInsert('Categories', categories, {});

  },

  async down(queryInterface, Sequelize) {

    await queryInterface.bulkDelete('Categories', null, {});

  }
};
