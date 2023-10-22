'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Products', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      name: {
        type: Sequelize.STRING,
        allowNull: false
      },
      description: {
        type: Sequelize.TEXT,
        allowNull: false
      },
      price: {
        type: Sequelize.INTEGER.UNSIGNED,
        allowNull: false
      },
      discount: {
        type: Sequelize.INTEGER.UNSIGNED,
        defaultValue: 0
      },
      categoriId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        refences: {
          model : {
            tableName : 'Categoris'
          }
        }
      },
      sectionId: {
        type: Sequelize.INTEGER,
        defaultValue: 1,
        refences: {
          model : {
            tableName : 'Sections'
          }
        }
      },
      brandId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        refences: {
          model : {
            tableName : 'Brands'
          }
        }
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Products');
  }
};