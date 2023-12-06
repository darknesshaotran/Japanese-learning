const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const { accessTokenValidator } = require('../middlewares/user.middlewares');
const appointmentController = require('../controllers/appointment.controller');
const checkout_session = require('../utils/stripe');

// const { loginValidator } = require('../middlewares/user.middlewares.js');

const router = Router();

// const UserController = require('../controllers/user.controllers');
router.post('/', accessTokenValidator, wrapController(checkout_session));

module.exports = router;
