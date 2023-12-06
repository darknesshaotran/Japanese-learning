const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');
const appointmentServices = require('../services/appointment.services');

class AppointmentsController {
    async setAppointment(req, res, next) {
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const { teacher_id, description, start_time, end_time } = req.body;
        const result = await appointmentServices.setAppointment(userID, teacher_id, description, start_time, end_time);
        return res.json(result);
    }
    async getAppointmentList(req, res, next) {
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const { limit, page } = req.query;

        const result = await appointmentServices.getAppointmentList(limit, page, userID);
        return res.json(result);
    }
}

module.exports = new AppointmentsController();
