const express = require("express");
const productRouter = express.Router();
const { Product } = require("../models/product");

// Helper for standardized responses
const sendResponse = (res, status, success, message, data = null) => {
    return res.status(status).json({
        success,
        message,
        data,
    });
};

// Fetch products by category
productRouter.get("/api/products", async (req, res) => {
    try {
        const { category } = req.query;
        if (!category) return sendResponse(res, 400, false, "Category is required.");

        const products = await Product.find({ category });
        return sendResponse(res, 200, true, `${products.length} products fetched for ${category}`, products);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Search products with sort
productRouter.get("/api/products/search/:name", async (req, res) => {
    try {
        const { sort } = req.query;
        let sortOptions = {};

        if (sort === "price-low") sortOptions = { price: 1 };
        else if (sort === "price-high") sortOptions = { price: -1 };
        else if (sort === "newest") sortOptions = { _id: -1 };

        const products = await Product.find({
            name: { $regex: req.params.name, $options: "i" },
        }).sort(sortOptions);

        return sendResponse(res, 200, true, "Search completed", products);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Recommendations
productRouter.get("/api/products/recommendations/:category", async (req, res) => {
    try {
        const products = await Product.find({
            category: req.params.category,
        }).limit(10);
        return sendResponse(res, 200, true, "Recommendations fetched", products);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Deal of the day
productRouter.get("/api/deal-of-day", async (req, res) => {
    try {
        let products = await Product.find({});
        if (products.length === 0) return sendResponse(res, 404, false, "No products found for deal of day.");

        products = products.sort((a, b) => {
            let aSum = (a.ratings || []).reduce((sum, r) => sum + r.rating, 0);
            let bSum = (b.ratings || []).reduce((sum, r) => sum + r.rating, 0);
            return aSum < bSum ? 1 : -1;
        });

        return sendResponse(res, 200, true, "Deal of the day fetched", products[0]);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

module.exports = productRouter;
