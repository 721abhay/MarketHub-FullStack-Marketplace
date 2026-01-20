const express = require('express');
const aiRouter = express.Router();
const multer = require('multer');
const { analyzeImage } = require('../utils/azure_vision');
const sendResponse = require('../utils/responseHelper');
const Product = require('../models/product');

const upload = multer({ storage: multer.memoryStorage() });

// Visual Search Endpoint
aiRouter.post('/api/ai/visual-search', upload.single('image'), async (req, res) => {
    try {
        if (!req.file) {
            return sendResponse(res, 400, false, "No image uploaded");
        }

        // 1. Analyze image via Azure AI
        const analysis = await analyzeImage(req.file.buffer);

        // 2. Extract keywords (tags or description)
        const keywords = analysis.tags ? analysis.tags.slice(0, 3).map(t => t.name) : [];
        const description = analysis.description?.captions?.[0]?.text || "";

        // 3. Search database for matching products
        // Simple search logic: match keywords in name or description
        let query = keywords.length > 0 ? {
            $or: [
                { name: { $regex: keywords[0], $options: 'i' } },
                { description: { $regex: keywords[0], $options: 'i' } }
            ]
        } : { name: { $regex: description, $options: 'i' } };

        const products = await Product.find(query).limit(10);

        return sendResponse(res, 200, true, "Visual search complete", {
            analysis,
            products
        });

    } catch (error) {
        return sendResponse(res, 500, false, error.message);
    }
});

module.exports = aiRouter;
