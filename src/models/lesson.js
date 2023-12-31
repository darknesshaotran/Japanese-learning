'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Lesson extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            Lesson.belongsTo(models.Course, { foreignKey: 'course_id', targetKey: 'id' });
            // define association here
        }
    }
    Lesson.init(
        {
            course_id: DataTypes.INTEGER,
            title: DataTypes.STRING,
            description: DataTypes.TEXT,
            url: DataTypes.TEXT,
            status: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'Lesson',
        },
    );
    return Lesson;
};
