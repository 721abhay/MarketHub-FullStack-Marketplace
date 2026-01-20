const express = require("express");
const mongoose = require("mongoose");
const userRouter = express.Router();
const auth = require("../middlewares/auth");
const Order = require("../models/order");
const { Product } = require("../models/product");
const User = require("../models/user");
const Notification = require("../models/notification");
const sendResponse = require("../utils/responseHelper");

// Save User Address
userRouter.post("/api/save-user-address", auth, async (req, res) => {
    try {
        const { address } = req.body;
        let user = await User.findById(req.user);
        user.address = address;
        user = await user.save();
        return sendResponse(res, 200, true, "Address updated successfully", user);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Order Product (Transactional)
userRouter.post("/api/order", auth, async (req, res) => {
    const session = await mongoose.startSession();
    session.startTransaction();
    try {
        const { cart, totalPrice, address } = req.body;
        let products = [];

        for (let i = 0; i < cart.length; i++) {
            // Find product and lock it (if compatible DB)
            // Using findOneAndUpdate for atomic check is safer, but inside transaction is standard
            let product = await Product.findOne({ _id: cart[i].product._id }).session(session);

            if (!product) {
                throw new Error(`Product not found!`);
            }

            if (product.quantity >= cart[i].quantity) {
                product.quantity -= cart[i].quantity;
                products.push({ product, quantity: cart[i].quantity, sellerId: product.sellerId });
                await product.save({ session });
            } else {
                throw new Error(`${product.name} is out of stock!`); // Will trigger abort
            }
        }

        let user = await User.findById(req.user).session(session);
        user.cart = [];
        await user.save({ session });

        let order = new Order({
            products,
            totalPrice,
            address,
            userId: req.user,
            orderedAt: new Date().getTime(),
        });
        order = await order.save({ session });

        await session.commitTransaction();
        session.endSession();

        return sendResponse(res, 200, true, "Order placed successfully", order);
    } catch (e) {
        await session.abortTransaction();
        session.endSession();
        return sendResponse(res, 400, false, e.message);
    }
});

// Get My Orders
userRouter.get("/api/orders/me", auth, async (req, res) => {
    try {
        const orders = await Order.find({ userId: req.user });
        return sendResponse(res, 200, true, "Orders fetched", orders);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Rate Product
userRouter.post("/api/rate-product", auth, async (req, res) => {
    try {
        const { id, rating } = req.body;
        let product = await Product.findById(id);

        for (let i = 0; i < product.ratings.length; i++) {
            if (product.ratings[i].userId == req.user) {
                product.ratings.splice(i, 1);
                break;
            }
        }

        const ratingSchema = {
            userId: req.user,
            rating,
        };

        product.ratings.push(ratingSchema);
        product = await product.save();
        res.json(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Get Notifications
userRouter.get("/api/notifications", auth, async (req, res) => {
    try {
        const notifications = await Notification.find({ userId: req.user }).sort({ createdAt: -1 });
        res.json(notifications);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Mark Notification as Read
userRouter.post("/api/mark-notification-read", auth, async (req, res) => {
    try {
        const { id } = req.body;
        let notification = await Notification.findById(id);
        notification.isRead = true;
        notification = await notification.save();
        res.json(notification);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Top Up Wallet (Simulated)
userRouter.post("/api/top-up-wallet", auth, async (req, res) => {
    try {
        const { amount } = req.body;
        let user = await User.findById(req.user);
        user.wallet += amount;
        user = await user.save();
        return sendResponse(res, 200, true, "Wallet topped up", user);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Update Recently Viewed
userRouter.post("/api/recently-viewed", auth, async (req, res) => {
    try {
        const { id } = req.body;
        const product = await Product.findById(id);

        if (!product) {
            return res.status(404).json({ msg: "Product not found!" });
        }

        let user = await User.findById(req.user);

        // Remove if already exists to move it to the front
        user.recentlyViewed = user.recentlyViewed.filter(
            (item) => item.product && item.product._id.toString() !== id
        );

        user.recentlyViewed.unshift({ product, viewedAt: new Date().getTime() });

        // Keep only top 15
        if (user.recentlyViewed.length > 15) {
            user.recentlyViewed.pop();
        }

        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Toggle Wishlist
userRouter.post("/api/wishlist", auth, async (req, res) => {
    try {
        const { id } = req.body;
        const product = await Product.findById(id);

        if (!product) {
            return res.status(404).json({ msg: "Product not found!" });
        }

        let user = await User.findById(req.user);

        const isFound = user.wishlist.some(
            (item) => item.product && item.product._id.toString() === id
        );

        if (isFound) {
            user.wishlist = user.wishlist.filter(
                (item) => item.product._id.toString() !== id
            );
        } else {
            user.wishlist.push({ product });
        }

        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = userRouter;
