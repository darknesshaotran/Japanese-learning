'use strict';
const { Model } = require('sequelize');

module.exports = (sequelize, DataTypes) => {
    class User extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            User.hasOne(models.Teacher, { foreignKey: 'user_id' });
            User.hasMany(models.Rating, { foreignKey: 'user_id' });

            // define association here
        }
    }
    User.init(
        {
            nick_name: DataTypes.STRING,
            mail: DataTypes.STRING,
            password: DataTypes.STRING,
            avatar: DataTypes.STRING,
            gender: DataTypes.INTEGER,
            first_name: DataTypes.STRING,
            last_name: DataTypes.STRING,
            dob: DataTypes.DATE,
            role: DataTypes.STRING,
            status: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'User',
        },
    );
    return User;
};
