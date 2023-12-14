const messageServices = require('../services/message.services');

class MessageController {
    async getConversationOfAnStudent(req, res, next) {
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const { teacher_id } = req.params;
        const { page, limit } = req.query;
        const result = await messageServices.getConversationOfAnStudent(
            userID,
            teacher_id,
            Number(page),
            Number(limit),
        );
        res.json(result);
    }
    // async getConversationList(req, res, next) {
    //     const { decoded_authorization } = req;
    //     const userID = decoded_authorization.userID;
    //     const { page, limit } = req.query;
    //     const result = await messageServices.getConversationList(userID, Number(page), Number(limit));
    //     res.json(result);
    // }
    async addMessage(req, res, next) {
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const { message, receiver_id } = req.body;
        const result = await messageServices.addMessage(userID, message, receiver_id);
        res.json(result);
    }
}
module.exports = new MessageController();
