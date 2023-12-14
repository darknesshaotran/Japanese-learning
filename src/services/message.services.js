const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');

class MessageServices {
    async addMessage(userID, message, receiver_id) {
        const user = await db.User.findOne({
            where: { id: userID },
            attributes: {
                exclude: ['password'],
            },
        });
        if (user.role === 'teacher') {
            await db.Message.create({
                student_id: receiver_id,
                teacher_id: userID,
                message: message,
                message_date: new Date(),
                isTeacher: 1,
            });
        } else {
            await db.Message.create({
                student_id: userID,
                teacher_id: receiver_id,
                message: message,
                message_date: new Date(),
                isTeacher: 0,
            });
        }

        return {
            success: true,
            message: 'send message successfully',
        };
    }
    // async getConversationList(userID, page, limit) {
    //     const conversations = await db.Message.findAll({
    //         where: db.sequelize.literal(
    //             `Message.id IN (SELECT MAX(Messages.id) FROM Messages WHERE student_id = ${userID})`,
    //         ),

    //         attributes: ['id', 'message', 'message_date'],
    //         include: [
    //             {
    //                 model: db.Account,
    //                 as: 'teacher',
    //                 attributes: {
    //                     exclude: ['password', 'role', 'createdAt', 'updatedAt'],
    //                 },
    //             },
    //             {
    //                 model: db.Account,
    //                 as: 'student',
    //                 attributes: {
    //                     exclude: ['password', 'role', 'createdAt', 'updatedAt'],
    //                 },
    //             },
    //         ],
    //         offset: (page - 1) * limit,
    //         limit: limit,
    //         group: ['student_id'],
    //         order: [[db.sequelize.literal('createdAt'), 'DESC']],
    //     });
    //     return {
    //         success: true,
    //         conversations: conversations,
    //     };
    // }
    async getConversationOfAnStudent(userID, teacher_id, page, limit) {
        var offset = 0;
        if (page && limit) {
            offset = (page - 1) * limit;
        }
        if (!limit) {
            limit = 100;
        }

        const messages = await db.Message.findAll({
            where: {
                student_id: userID,
                teacher_id: teacher_id,
            },

            offset: offset,
            limit: limit,
            order: [['message_date', 'ASC']],
        });
        const conversation = JSON.parse(JSON.stringify(messages));
        return {
            success: true,
            messages: conversation,
        };
    }
}

module.exports = new MessageServices();
