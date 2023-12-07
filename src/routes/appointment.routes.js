const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const { accessTokenValidator } = require('../middlewares/user.middlewares');
const appointmentController = require('../controllers/appointment.controller');

// const { loginValidator } = require('../middlewares/user.middlewares.js');

const router = Router();

// const UserController = require('../controllers/user.controllers');
router.get(
    '/studentAppointment',
    accessTokenValidator,
    wrapController(appointmentController.getStudentAppointmentList),
);
router.get(
    '/teacherAppointment',
    accessTokenValidator,
    wrapController(appointmentController.getTeacherAppointMentList),
);
router.post('/setAppointment', accessTokenValidator, wrapController(appointmentController.setAppointment));
module.exports = router;
