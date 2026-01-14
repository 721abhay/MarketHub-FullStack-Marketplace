const express = require("express");
const productRouter = express.Router();
const { Product } = require("../models/product");

// Fetch products by category
productRouter.get("/api/products", async (req, res) => {
    console.log('📦 Product Fetch Request:', req.query);
    try {
        const products = await Product.find({ category: req.query.category });
        console.log(`✅ Found ${products.length} products for category: ${req.query.category}`);
        res.json(products);
    } catch (e) {
        console.log('❌ Product Fetch Error:', e.message);
        res.status(500).json({ error: e.message });
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

        res.json(products);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Get recommended products by category
productRouter.get("/api/products/recommendations/:category", async (req, res) => {
    try {
        const products = await Product.find({
            category: req.params.category,
        }).limit(10);
        res.json(products);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Deal of the day logic
productRouter.get("/api/deal-of-day", async (req, res) => {
    try {
        let products = await Product.find({});

        products = products.sort((a, b) => {
            let aSum = 0;
            let bSum = 0;

            for (let i = 0; i < a.ratings.length; i++) {
                aSum += a.ratings[i].rating;
            }

            for (let i = 0; i < b.ratings.length; i++) {
                bSum += b.ratings[i].rating;
            }
            return aSum < bSum ? 1 : -1;
        });

        res.json(products[0]);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = productRouter;
