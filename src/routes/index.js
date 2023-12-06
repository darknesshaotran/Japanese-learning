const teacherRoute = require('./teacher.routes');
const courseRoute = require('./course.routes');
const userRoute = require('./user.routes');
const AppointmentRoute = require('./appointment.routes');
const paymentRoute = require('./payment.routes');

const route = (app) => {
    app.use('/api/teacher', teacherRoute);
    app.use('/api/payment', paymentRoute);
    app.use('/api/appointment', AppointmentRoute);
    app.use('/api/course', courseRoute);
    app.use('/api/user', userRoute);
    // ////////////////////////////////
    app.use('/paymentSuccess', (req, res, next) => {
        return res.send('PAYMENT SUCCESSFUL');
    });
    app.use('/paymentFail', (req, res, next) => {
        return res.send('PAYMENT FAILED');
    });
    app.use('/', (req, res, next) => {
        return res.send('WELCOME TO SERVER');
    });
};

module.exports = route;
