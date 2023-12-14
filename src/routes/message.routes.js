const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const { accessTokenValidator } = require('../middlewares/user.middlewares');
const appointmentController = require('../controllers/appointment.controller');
const messageControllers = require('../controllers/message.controllers');

// const { loginValidator } = require('../middlewares/user.middlewares.js');

const router = Router();

router.get(
    '/studentMessages/:teacher_id',
    accessTokenValidator,
    wrapController(messageControllers.getConversationOfAnStudent),
);
router.post('/', accessTokenValidator, wrapController(messageControllers.addMessage));
module.exports = router;
