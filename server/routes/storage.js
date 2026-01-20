const express = require("express");
const storageRouter = express.Router();
const multer = require("multer");
const { uploadToAzure } = require("../utils/azureStorage");
const auth = require("../middlewares/auth");
const sendResponse = require("../utils/responseHelper");

// Multer in-memory storage for Azure upload
const upload = multer({
    storage: multer.memoryStorage(),
    limits: { fileSize: 5 * 1024 * 1024 }, // 5MB Limit
});

// Upload single image
storageRouter.post("/api/upload/image", auth, upload.single("image"), async (req, res) => {
    try {
        if (!req.file) {
            return sendResponse(res, 400, false, "Please select an image to upload");
        }

        const result = await uploadToAzure(req.file);

        return sendResponse(res, 201, true, "Image uploaded successfully", {
            url: result.url,
            key: result.key,
        });
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Upload multiple images
storageRouter.post("/api/upload/images", auth, upload.array("images", 5), async (req, res) => {
    try {
        if (!req.files || req.files.length === 0) {
            return sendResponse(res, 400, false, "Please select images to upload");
        }

        const uploadPromises = req.files.map(file => uploadToAzure(file));
        const results = await Promise.all(uploadPromises);

        return sendResponse(res, 201, true, "Images uploaded successfully", results);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

module.exports = storageRouter;
