const mongoose = require("mongoose");

const promoCodeSchema = mongoose.Schema({
    code: {
        type: String,
        required: true,
        unique: true,
        trim: true,
    },
    discountPercent: {
        type: Number,
        required: true,
    },
    maxDiscount: {
        type: Number,
    },
    expiryDate: {
        type: Number,
        required: true,
    },
    isActive: {
        type: Boolean,
        default: true,
    },
});

const PromoCode = mongoose.model("PromoCode", promoCodeSchema);
module.exports = PromoCode;
