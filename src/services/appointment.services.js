const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');
const db = require('../models');
const { Op } = require('sequelize');

class AppointmentServices {
    async getStudentAppointmentList(limit, page, userID) {
        var offset = 0;
        if (page && limit) {
            offset = (page - 1) * limit;
        }
        if (!limit) {
            limit = 100;
        }

        const options = {
            student_id: userID,
        };
        const Count = await db.Appointment.count({
            where: {
                ...options,
            },
        });
        const appointments = await db.Appointment.findAll({
            where: {
                ...options,
            },
            offset: Number(offset),
            limit: Number(limit),
            order: [['start_time', 'DESC']],
            attributes: {
                exclude: ['createdAt', 'updatedAt'],
            },
            include: [
                {
                    model: db.Teacher,
                    attributes: {
                        exclude: ['createdAt', 'updatedAt'],
                    },
                    include: [
                        {
                            model: db.User,
                            // as: 'inforUser',
                            attributes: {
                                exclude: ['id', 'password', 'createdAt', 'updatedAt'],
                            },
                        },
                    ],
                },
            ],
        });
        const Appointments = JSON.parse(JSON.stringify(appointments));

        const totalPages = Math.ceil(Count / limit);
        return {
            success: true,
            result: Appointments,
            totalPages: totalPages,
            page: page ? page : 1,
        };
    }
    async getTeacherAppointmentList(limit, page, userID) {
        var offset = 0;
        if (page && limit) {
            offset = (page - 1) * limit;
        }
        if (!limit) {
            limit = 100;
        }

        const options = {
            teacher_id: userID,
        };
        const Count = await db.Appointment.count({
            where: {
                ...options,
            },
        });
        const appointments = await db.Appointment.findAll({
            where: {
                ...options,
            },
            offset: Number(offset),
            limit: Number(limit),
            order: [['start_time', 'DESC']],
            attributes: {
                exclude: ['createdAt', 'updatedAt'],
            },
            include: [
                {
                    model: db.User,
                    as: 'Student',
                    attributes: {
                        exclude: ['id', 'password', 'createdAt', 'updatedAt'],
                    },
                },
            ],
        });
        const Appointments = JSON.parse(JSON.stringify(appointments));

        const totalPages = Math.ceil(Count / limit);
        return {
            success: true,
            result: Appointments,
            totalPages: totalPages,
            page: page ? page : 1,
        };
    }
    async setAppointment(userID, teacher_id, description, start_time, end_time) {
        if (!(teacher_id && start_time && end_time)) {
            throw new Error('vui lòng điền đầy đủ thông tin');
        }
        const options = {
            student_id: userID,
            teacher_id: teacher_id,
            description: description ? description : '',
            start_time: start_time,
            end_time: end_time,
        };
        await db.Appointment.create(options);
        return {
            success: true,
            message: 'Set Appointment successfully',
        };
    }
}
module.exports = new AppointmentServices();
