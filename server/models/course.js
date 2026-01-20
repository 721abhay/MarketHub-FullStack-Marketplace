const mongoose = require("mongoose");

const courseSchema = new mongoose.Schema({
    title: { type: String, required: true, trim: true },
    instructor: { type: String, required: true },
    duration: { type: String, required: true },
    thumbnail: { type: String, required: true },
    category: { type: String, required: true },
    price: { type: Number, default: 0 },
    rating: { type: Number, default: 0 },
    enrolledCount: { type: Number, default: 0 },
    lessons: [{
        title: String,
        duration: String
    }],
    createdAt: { type: Date, default: Date.now }
});

module.exports = mongoose.model("Course", courseSchema);
