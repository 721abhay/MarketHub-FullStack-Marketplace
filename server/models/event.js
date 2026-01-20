const mongoose = require("mongoose");

const eventSchema = new mongoose.Schema({
    name: { type: String, required: true },
    location: { type: String, required: true },
    date: { type: Date, required: true },
    organizer: { type: String, required: true },
    image: { type: String, required: true },
    category: { type: String, enum: ['Tech', 'Music', 'Business', 'Social', 'Workshop'], default: 'Social' },
    attendeesCount: { type: Number, default: 0 },
    description: { type: String },
    ticketPrice: { type: Number, default: 0 }
});

module.exports = mongoose.model("Event", eventSchema);
