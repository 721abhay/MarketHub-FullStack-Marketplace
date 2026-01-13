const express = require("express");
const sellerRouter = express.Router();
const { Product } = require("../models/product");
const Order = require("../models/order");
const seller = require("../middlewares/seller");
const Notification = require("../models/notification");
const Payout = require("../models/payout");
const User = require("../models/user");

// Seller Add Product
sellerRouter.post("/seller/add-product", seller, async (req, res) => {
    try {
        const { name, description, images, quantity, price, category } = req.body;
        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category,
            sellerId: req.user,
        });
        product = await product.save();
        res.json(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Get all products by seller
sellerRouter.get("/seller/get-products/:sellerId", seller, async (req, res) => {
    try {
        const products = await Product.find({ sellerId: req.params.sellerId });
        res.json(products);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Advanced Analytics (Phase 4)
sellerRouter.get("/seller/analytics/:sellerId", seller, async (req, res) => {
    try {
        const sellerId = req.params.sellerId;
        const orders = await Order.find({ "products.sellerId": sellerId });
        const products = await Product.find({ sellerId });

        let totalEarnings = 0;
        let cityData = {};
        let dailyRevenue = {}; // Last 7 days
        let productVelocity = {};

        const now = new Date().getTime();
        const sevenDaysAgo = now - (7 * 24 * 60 * 60 * 1000);

        orders.forEach(order => {
            // Heatmap calculation
            const addressParts = order.address.split(',');
            if (addressParts.length > 2) {
                const cityPart = addressParts[addressParts.length - 1].split('-')[0].trim();
                cityData[cityPart] = (cityData[cityPart] || 0) + 1;
            }

            order.products.forEach(p => {
                if (p.sellerId == sellerId) {
                    const price = p.product.price;
                    const qty = p.quantity;
                    totalEarnings += (price * qty);

                    // Daily Revenue (Last 7 days)
                    if (order.orderedAt > sevenDaysAgo) {
                        const date = new Date(order.orderedAt).toLocaleDateString();
                        dailyRevenue[date] = (dailyRevenue[date] || 0) + (price * qty);
                    }

                    // Product Velocity
                    productVelocity[p.product._id] = (productVelocity[p.product._id] || 0) + qty;
                }
            });
        });

        // Top Regions
        const sortedRegions = Object.entries(cityData)
            .sort((a, b) => b[1] - a[1])
            .slice(0, 5)
            .map(entry => ({ name: entry[0], count: entry[1] }));

        // Inventory AI Insights
        const inventoryInsights = products.map(p => {
            const soldTotal = productVelocity[p._id] || 0;
            const daysActive = 30; // Assuming 30-day window for velocity
            const velocityPerDay = soldTotal / daysActive;
            const daysLeft = velocityPerDay > 0 ? Math.floor(p.quantity / velocityPerDay) : 999;

            return {
                id: p._id,
                name: p.name,
                stock: p.quantity,
                velocity: velocityPerDay.toFixed(2),
                daysLeft: daysLeft > 100 ? "100+" : daysLeft,
                status: p.quantity < 5 ? 'critical' : (daysLeft < 7 ? 'warning' : 'healthy')
            };
        });

        res.json({
            totalEarnings,
            totalProducts: products.length,
            totalOrders: orders.length,
            topRegions: sortedRegions,
            dailyRevenue,
            inventoryInsights
        });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Update Order Status (Phase 2)
sellerRouter.post("/seller/update-order-status", seller, async (req, res) => {
    try {
        const { id, status } = req.body;
        let order = await Order.findById(id);
        order.status = status;
        order = await order.save();

        // Create notification for user
        const statusNames = ['Pending', 'Confirmed', 'Shipped', 'Delivered', 'Cancelled'];
        let notification = new Notification({
            userId: order.userId,
            title: `Order #${id.substring(id.length - 8).toUpperCase()} Updated`,
            body: `Your order status has been updated to: ${statusNames[status]}`,
            type: 'order',
            createdAt: new Date().getTime(),
        });
        await notification.save();

        if (status === 3) {
            // Update seller wallet
            let sellerUser = await User.findById(req.user);
            let earnings = 0;
            order.products.forEach((p) => {
                if (p.sellerId === req.user) {
                    earnings += p.quantity * p.product.price;
                }
            });
            sellerUser.wallet += earnings;
            await sellerUser.save();
        }

        res.json(order);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Get seller orders
sellerRouter.get("/seller/get-orders/:sellerId", seller, async (req, res) => {
    try {
        const orders = await Order.find({ "products.sellerId": req.params.sellerId });
        res.json(orders);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Payout Request
sellerRouter.post("/seller/request-payout", seller, async (req, res) => {
    try {
        const { amount, bankDetails } = req.body;
        let user = await User.findById(req.user);

        if (user.wallet < amount) {
            return res.status(400).json({ msg: "Insufficient balance in wallet!" });
        }

        user.wallet -= amount;
        await user.save();

        let payout = new Payout({
            sellerId: req.user,
            amount,
            bankDetails,
            requestedAt: new Date().getTime(),
        });
        payout = await payout.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Get Payout History
sellerRouter.get("/seller/payouts/:sellerId", seller, async (req, res) => {
    try {
        const payouts = await Payout.find({ sellerId: req.params.sellerId }).sort({ requestedAt: -1 });
        res.json(payouts);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = sellerRouter;
