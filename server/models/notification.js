const mongoose = require("mongoose");

const notificationSchema = mongoose.Schema({
    userId: {
        type: String,
        required: true,
    },
    title: {
        type: String,
        required: true,
    },
    body: {
        type: String,
        required: true,
    },
    type: {
        type: String, // 'order', 'promo', 'system'
        default: 'order',
    },
    isRead: {
        type: Boolean,
        default: false,
    },
    createdAt: {
        type: Number,
        required: true,
    },
});

const Notification = mongoose.model("Notification", notificationSchema);
module.exports = Notification;
