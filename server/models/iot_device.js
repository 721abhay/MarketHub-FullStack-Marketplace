const mongoose = require("mongoose");

const iotDeviceSchema = new mongoose.Schema({
    name: { type: String, required: true },
    type: { type: String, required: true }, // e.g. "Light", "Camera", "Lock"
    status: { type: String, default: 'Offline' },
    battery: { type: String, default: '100%' },
    room: { type: String, default: 'Living Room' },
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    lastSync: { type: Date, default: Date.now }
});

module.exports = mongoose.model("IoTDevice", iotDeviceSchema);
