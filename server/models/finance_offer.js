const mongoose = require("mongoose");

const financialOfferSchema = new mongoose.Schema({
    title: { type: String, required: true },
    rate: { type: String, required: true }, // e.g. "4.5% APY"
    provider: { type: String, required: true },
    type: { type: String, enum: ['Savings', 'Investment', 'Loan', 'Credit Card', 'Insurance'], required: true },
    minimumDeposit: { type: Number, default: 0 },
    reward: { type: String },
    description: { type: String },
    benefits: [String]
});

module.exports = mongoose.model("FinancialOffer", financialOfferSchema);
