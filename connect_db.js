const { Sequelize } = require('sequelize');
const sequelize = new Sequelize('byh16ujrvmxxwmhur8vd', 'u90pbylcc8puywds', 'F1KmWOkWYX1exxs8FYyg', {
    host: 'byh16ujrvmxxwmhur8vd-mysql.services.clever-cloud.com',
    dialect: 'mysql',
    logging: false,
});
const conenctionDatabase = async () => {
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
};

module.exports = conenctionDatabase;
