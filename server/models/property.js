const mongoose = require("mongoose");

const propertySchema = new mongoose.Schema({
    title: { type: String, required: true },
    location: { type: String, required: true },
    price: { type: Number, required: true },
    type: { type: String, enum: ['Sale', 'Rent'], required: true },
    image: { type: String, required: true },
    bedrooms: { type: Number },
    bathrooms: { type: Number },
    area: { type: String }, // e.g. "1200 sqft"
    description: { type: String }
});

module.exports = mongoose.model("Property", propertySchema);
