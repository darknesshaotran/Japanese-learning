const dotenv = require('dotenv');
dotenv.config();
const stripe = require('stripe')(process.env.STRIPE_PRIVATE_KEY);
const checkout_session = async (req, res, next) => {
    try {
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const charge = await stripe.charges.create({
            amount: Number(req.body.amount),
            currency: 'usd',
            source: 'tok_visa',
            description: 'payment for online course',
        });
        res.json({ success: true, message: 'payment successful' });
    } catch (err) {
        console.error(err);
        throw new Error('payment failed');
    }
};
module.exports = checkout_session;
