const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const { accessTokenValidator } = require('../middlewares/user.middlewares');
const appointmentController = require('../controllers/appointment.controller');

// const { loginValidator } = require('../middlewares/user.middlewares.js');

const router = Router();

// const UserController = require('../controllers/user.controllers');
router.get('/', accessTokenValidator, wrapController(appointmentController.getAppointmentList));
router.post('/setAppointment', accessTokenValidator, wrapController(appointmentController.setAppointment));
module.exports = router;
