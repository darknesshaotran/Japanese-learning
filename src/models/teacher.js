'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Teacher extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            Teacher.belongsTo(models.User, { foreignKey: 'user_id', targetKey: 'id' });
            Teacher.hasMany(models.Course, { foreignKey: 'teacher_id' });
        }
    }
    Teacher.init(
        {
            user_id: DataTypes.INTEGER,
            detail_infor: DataTypes.STRING,
            experience: DataTypes.STRING,
            jp_level: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'Teacher',
        },
    );
    return Teacher;
};
