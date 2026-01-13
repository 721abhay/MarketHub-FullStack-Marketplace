const express = require("express");
const adminRouter = express.Router();
const { Product } = require("../models/product");

// Add Product (Admin can also add featured products)
adminRouter.post("/admin/add-product", async (req, res) => {
    try {
        const { name, description, images, quantity, price, category, sellerId } = req.body;
        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category,
            sellerId: sellerId || req.user, // Fallback if admin is adding on behalf
        });
        product = await product.save();
        res.json(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Get all products for moderation
adminRouter.get("/admin/get-products", async (req, res) => {
    try {
        const products = await Product.find({});
        res.json(products);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

const User = require("../models/user");
const Order = require("../models/order");

// Get all users/sellers
adminRouter.get("/admin/get-users", async (req, res) => {
    try {
        const users = await User.find({});
        res.json(users);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Update Seller Verification Status
adminRouter.post("/admin/verify-seller", async (req, res) => {
    try {
        const { id, isVerified } = req.body;
        let user = await User.findById(id);
        if (user && user.sellerDetails) {
            user.sellerDetails.isVerified = isVerified;
            user = await user.save();
        }
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Get Platform Analytics
adminRouter.get("/admin/analytics", async (req, res) => {
    try {
        const orders = await Order.find({});
        const users = await User.find({});
        const products = await Product.find({});

        let totalGMV = 0;
        orders.forEach(order => {
            totalGMV += order.totalPrice;
        });

        res.json({
            totalGMV,
            totalOrders: orders.length,
            totalUsers: users.length,
            totalProducts: products.length,
            sellers: users.filter(u => u.type === 'seller').length,
            buyers: users.filter(u => u.type === 'user').length,
        });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Delete Product
adminRouter.post("/admin/delete-product", async (req, res) => {
    try {
        const { id } = req.body;
        let product = await Product.findByIdAndDelete(id);
        res.json(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = adminRouter;
