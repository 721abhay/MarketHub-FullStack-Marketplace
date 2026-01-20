const mongoose = require("mongoose");

const consultationSchema = new mongoose.Schema({
    doctorName: { type: String, required: true },
    specialty: { type: String, required: true },
    experience: { type: String },
    rating: { type: Number, default: 5.0 },
    fee: { type: Number, required: true },
    image: { type: String },
    availability: [String]
});

module.exports = mongoose.model("Consultation", consultationSchema);
