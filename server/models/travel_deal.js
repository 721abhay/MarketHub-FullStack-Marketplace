const mongoose = require("mongoose");

const travelDealSchema = new mongoose.Schema({
    type: { type: String, enum: ['Flight', 'Bus', 'Train', 'Hotel'], required: true },
    from: { type: String },
    to: { type: String },
    price: { type: Number, required: true },
    date: { type: Date },
    provider: { type: String, required: true },
    logo: { type: String },
    rating: { type: Number, default: 4.5 },
    details: { type: String }
});

module.exports = mongoose.model("TravelDeal", travelDealSchema);
