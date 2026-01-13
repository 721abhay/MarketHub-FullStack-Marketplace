const express = require("express");
const userRouter = express.Router();
const auth = require("../middlewares/auth");
const Order = require("../models/order");
const { Product } = require("../models/product");
const User = require("../models/user");
const Notification = require("../models/notification");

// Save User Address
userRouter.post("/api/save-user-address", auth, async (req, res) => {
    try {
        const { address } = req.body;
        let user = await User.findById(req.user);
        user.address = address;
        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Order Product
userRouter.post("/api/order", auth, async (req, res) => {
    try {
        const { cart, totalPrice, address } = req.body;
        let products = [];

        for (let i = 0; i < cart.length; i++) {
            let product = await Product.findById(cart[i].product._id);
            if (product.quantity >= cart[i].quantity) {
                product.quantity -= cart[i].quantity;
                products.push({ product, quantity: cart[i].quantity, sellerId: product.sellerId });
                await product.save();
            } else {
                return res.status(400).json({ msg: `${product.name} is out of stock!` });
            }
        }

        let user = await User.findById(req.user);
        user.cart = [];
        user = await user.save();

        let order = new Order({
            products,
            totalPrice,
            address,
            userId: req.user,
            orderedAt: new Date().getTime(),
        });
        order = await order.save();
        res.json(order);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Get My Orders
userRouter.get("/api/orders/me", auth, async (req, res) => {
    try {
        const orders = await Order.find({ userId: req.user });
        res.json(orders);
    } catch (e) {
        res.status(500).json({ error: e.message });
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
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Update Recently Viewed
userRouter.post("/api/recently-viewed", auth, async (req, res) => {
    try {
        const { id } = req.body;
        const product = await Product.findById(id);
        let user = await User.findById(req.user);

        // Remove if already exists to move it to the front
        user.recentlyViewed = user.recentlyViewed.filter(
            (item) => item.product._id.toString() !== id
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
        let user = await User.findById(req.user);

        const isFound = user.wishlist.some(
            (item) => item.product._id.toString() === id
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
