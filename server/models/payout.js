const mongoose = require("mongoose");

const payoutSchema = mongoose.Schema({
    sellerId: {
        type: String,
        required: true,
    },
    amount: {
        type: Number,
        required: true,
    },
    status: {
        type: String, // 'pending', 'approved', 'rejected'
        default: 'pending',
    },
    bankDetails: {
        accountNumber: String,
        ifscCode: String,
        bankName: String,
    },
    requestedAt: {
        type: Number,
        required: true,
    },
    processedAt: {
        type: Number,
    },
});

const Payout = mongoose.model("Payout", payoutSchema);
module.exports = Payout;
