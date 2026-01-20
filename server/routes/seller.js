const express = require("express");
const sellerRouter = express.Router();
const { Product } = require("../models/product");
const Order = require("../models/order");
const seller = require("../middlewares/seller");
const Notification = require("../models/notification");
const Payout = require("../models/payout");
const User = require("../models/user");

// Helper for standardized responses
const sendResponse = (res, status, success, message, data = null) => {
    return res.status(status).json({
        success,
        message,
        data,
    });
};

// Seller Add Product
sellerRouter.post("/seller/add-product", seller, async (req, res) => {
    try {
        const { name, description, images, quantity, price, category } = req.body;

        if (!name || name.length < 3) return sendResponse(res, 400, false, "Product name is too short.");
        if (price <= 0) return sendResponse(res, 400, false, "Price must be positive.");
        if (quantity < 0) return sendResponse(res, 400, false, "Quantity cannot be negative.");

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
        return sendResponse(res, 201, true, "Product added successfully", product);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Get products by seller
sellerRouter.get("/seller/get-products/:sellerId", seller, async (req, res) => {
    try {
        const products = await Product.find({ sellerId: req.params.sellerId });
        return sendResponse(res, 200, true, "Products fetched", products);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Analytics
sellerRouter.get("/seller/analytics/:sellerId", seller, async (req, res) => {
    try {
        const sellerId = req.params.sellerId;
        const orders = await Order.find({ "products.sellerId": sellerId });
        const products = await Product.find({ sellerId });

        let totalEarnings = 0;
        let cityData = {};
        let dailyRevenue = {};
        let productVelocity = {};

        const now = new Date().getTime();
        const sevenDaysAgo = now - (7 * 24 * 60 * 60 * 1000);

        orders.forEach(order => {
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

                    if (order.orderedAt > sevenDaysAgo) {
                        const date = new Date(order.orderedAt).toLocaleDateString();
                        dailyRevenue[date] = (dailyRevenue[date] || 0) + (price * qty);
                    }
                    productVelocity[p.product._id] = (productVelocity[p.product._id] || 0) + qty;
                }
            });
        });

        const sortedRegions = Object.entries(cityData)
            .sort((a, b) => b[1] - a[1])
            .slice(0, 5)
            .map(entry => ({ name: entry[0], count: entry[1] }));

        const inventoryInsights = products.map(p => {
            const soldTotal = productVelocity[p._id] || 0;
            const velocityPerDay = soldTotal / 30;
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

        return sendResponse(res, 200, true, "Analytics fetched", {
            totalEarnings,
            totalProducts: products.length,
            totalOrders: orders.length,
            topRegions: sortedRegions,
            dailyRevenue,
            inventoryInsights
        });
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Update Order Status
sellerRouter.post("/seller/update-order-status", seller, async (req, res) => {
    try {
        const { id, status } = req.body;
        let order = await Order.findById(id);
        if (!order) return sendResponse(res, 404, false, "Order not found.");

        order.status = status;
        order = await order.save();

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
            let sellerUser = await User.findById(req.user);
            let earnings = order.products.reduce((sum, p) => {
                return p.sellerId === req.user ? sum + (p.quantity * p.product.price) : sum;
            }, 0);
            sellerUser.wallet += earnings;
            await sellerUser.save();
        }

        return sendResponse(res, 200, true, "Order status updated", order);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Get seller orders
sellerRouter.get("/seller/get-orders/:sellerId", seller, async (req, res) => {
    try {
        const orders = await Order.find({ "products.sellerId": req.params.sellerId });
        return sendResponse(res, 200, true, "Orders fetched", orders);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Payout Request
sellerRouter.post("/seller/request-payout", seller, async (req, res) => {
    try {
        const { amount, bankDetails } = req.body;
        let user = await User.findById(req.user);

        if (!amount || amount <= 0) return sendResponse(res, 400, false, "Invalid payout amount.");
        if (user.wallet < amount) return sendResponse(res, 400, false, "Insufficient wallet balance.");

        user.wallet -= amount;
        await user.save();

        const payout = new Payout({
            sellerId: req.user,
            amount,
            bankDetails,
            requestedAt: new Date().getTime(),
        });
        await payout.save();
        return sendResponse(res, 200, true, "Payout requested successfully", user);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Payout History
sellerRouter.get("/seller/payouts/:sellerId", seller, async (req, res) => {
    try {
        const payouts = await Payout.find({ sellerId: req.params.sellerId }).sort({ requestedAt: -1 });
        return sendResponse(res, 200, true, "Payout history fetched", payouts);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

module.exports = sellerRouter;
