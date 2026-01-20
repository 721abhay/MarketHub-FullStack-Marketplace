const mongoose = require("mongoose");

const badgeSchema = new mongoose.Schema({
    name: { type: String, required: true, unique: true },
    description: { type: String, required: true },
    criteria: { type: String, required: true },
    iconUrl: { type: String, required: true },
    xpValue: { type: Number, default: 50 },
    tier: { type: String, enum: ['Bronze', 'Silver', 'Gold', 'Elite'], default: 'Bronze' }
});

module.exports = mongoose.model("Badge", badgeSchema);
