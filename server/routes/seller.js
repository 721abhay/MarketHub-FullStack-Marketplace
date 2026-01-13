const express = require("express");
const sellerRouter = express.Router();
const { Product } = require("../models/product");
const Order = require("../models/order");

// Seller Add Product
sellerRouter.post("/seller/add-product", async (req, res) => {
    try {
        const { name, description, images, quantity, price, category, sellerId } = req.body;
        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category,
            sellerId,
        });
        product = await product.save();
        res.json(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Get all products by seller
sellerRouter.get("/seller/get-products/:sellerId", async (req, res) => {
    try {
        const products = await Product.find({ sellerId: req.params.sellerId });
        res.json(products);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Get seller analytics
sellerRouter.get("/seller/analytics/:sellerId", async (req, res) => {
    try {
        const orders = await Order.find({ "products.sellerId": req.params.sellerId });
        let totalEarnings = 0;

        for (let i = 0; i < orders.length; i++) {
            for (let j = 0; j < orders[i].products.length; j++) {
                if (orders[i].products[j].sellerId == req.params.sellerId) {
                    totalEarnings +=
                        orders[i].products[j].quantity * orders[i].products[j].product.price;
                }
            }
        }

        const products = await Product.find({ sellerId: req.params.sellerId });
        let totalProducts = products.length;

        // Group by category for chart
        let categoryData = {};
        products.forEach(p => {
            categoryData[p.category] = (categoryData[p.category] || 0) + 1;
        });

        res.json({
            totalEarnings,
            totalProducts,
            totalOrders: orders.length,
            categoryData
        });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Get seller orders
sellerRouter.get("/seller/get-orders/:sellerId", async (req, res) => {
    try {
        const orders = await Order.find({ "products.sellerId": req.params.sellerId });
        res.json(orders);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = sellerRouter;
