const express = require("express");
const adminRouter = express.Router();
const { Product } = require("../models/product");
const admin = require("../middlewares/admin");
const User = require("../models/user");
const Order = require("../models/order");

// Helper for standardized responses
const sendResponse = (res, status, success, message, data = null) => {
    return res.status(status).json({
        success,
        message,
        data,
    });
};

// Add Product
adminRouter.post("/admin/add-product", admin, async (req, res) => {
    try {
        const { name, description, images, quantity, price, category, sellerId } = req.body;

        // Validation
        if (!name || name.trim().length < 3) return sendResponse(res, 400, false, "Valid product name is required (min 3 chars).");
        if (!description || description.trim().length < 10) return sendResponse(res, 400, false, "Detailed description is required (min 10 chars).");
        if (!images || images.length === 0) return sendResponse(res, 400, false, "At least one product image is required.");
        if (price <= 0) return sendResponse(res, 400, false, "Price must be greater than zero.");
        if (quantity < 0) return sendResponse(res, 400, false, "Quantity cannot be negative.");
        if (!category) return sendResponse(res, 400, false, "Product category is required.");

        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category,
            sellerId: sellerId || req.user,
        });
        product = await product.save();
        return sendResponse(res, 201, true, "Product added successfully!", product);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Get all products
adminRouter.get("/admin/get-products", admin, async (req, res) => {
    try {
        const products = await Product.find({});
        return sendResponse(res, 200, true, "Products fetched", products);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Get all users/sellers
adminRouter.get("/admin/get-users", admin, async (req, res) => {
    try {
        const users = await User.find({});
        return sendResponse(res, 200, true, "Users fetched", users);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Update Seller Verification
adminRouter.post("/admin/verify-seller", admin, async (req, res) => {
    try {
        const { id, isVerified } = req.body;
        let user = await User.findById(id);
        if (!user) return sendResponse(res, 404, false, "User not found.");

        if (user.sellerDetails) {
            user.sellerDetails.isVerified = isVerified;
            user = await user.save();
        } else {
            return sendResponse(res, 400, false, "User is not registered as a seller.");
        }
        return sendResponse(res, 200, true, `Seller ${isVerified ? 'verified' : 'unverified'}`, user);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Analytics
adminRouter.get("/admin/analytics", admin, async (req, res) => {
    try {
        const orders = await Order.find({});
        const users = await User.find({});
        const products = await Product.find({});

        let totalGMV = orders.reduce((sum, order) => sum + order.totalPrice, 0);

        const analytics = {
            totalGMV,
            totalOrders: orders.length,
            totalUsers: users.length,
            totalProducts: products.length,
            sellersCount: users.filter(u => u.type === 'seller').length,
            buyersCount: users.filter(u => u.type === 'user').length,
        };
        return sendResponse(res, 200, true, "Analytics fetched", analytics);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Delete Product
adminRouter.post("/admin/delete-product", admin, async (req, res) => {
    try {
        const { id } = req.body;
        const product = await Product.findByIdAndDelete(id);
        if (!product) return sendResponse(res, 404, false, "Product not found.");
        return sendResponse(res, 200, true, "Product deleted", product);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

module.exports = adminRouter;
