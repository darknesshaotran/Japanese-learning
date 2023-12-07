'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Appointment extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            Appointment.belongsTo(models.Teacher, { foreignKey: 'teacher_id', targetKey: 'user_id' });
            Appointment.belongsTo(models.User, { foreignKey: 'student_id', targetKey: 'id', as: 'Student' });
        }
    }
    Appointment.init(
        {
            teacher_id: DataTypes.INTEGER,
            student_id: DataTypes.INTEGER,
            description: DataTypes.STRING,
            start_time: DataTypes.DATE,
            end_time: DataTypes.DATE,
        },
        {
            sequelize,
            modelName: 'Appointment',
        },
    );
    return Appointment;
};
