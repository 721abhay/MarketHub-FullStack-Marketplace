const mongoose = require("mongoose");
const { productSchema } = require("./product");

const orderSchema = mongoose.Schema({
    products: [
        {
            product: productSchema,
            quantity: {
                type: Number,
                required: true,
            },
            sellerId: {
                type: mongoose.Schema.Types.ObjectId,
                ref: "User",
                required: true,
            },
        },
    ],
    totalPrice: {
        type: Number,
        required: true,
    },
    address: {
        type: String,
        required: true,
    },
    userId: {
        required: true,
        type: String,
    },
    orderedAt: {
        type: Number,
        required: true,
    },
    status: {
        type: Number,
        default: 0,
        // 0: Pending
        // 1: Confirmed
        // 2: Shipped
        // 3: Delivered
        // 4: Cancelled
    },
});

const Order = mongoose.model("Order", orderSchema);
module.exports = Order;
