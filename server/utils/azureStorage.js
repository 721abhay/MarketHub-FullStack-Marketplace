const { BlobServiceClient } = require('@azure/storage-blob');
const path = require('path');

const AZURE_STORAGE_CONNECTION_STRING = process.env.AZURE_STORAGE_CONNECTION_STRING;
const CONTAINER_NAME = process.env.AZURE_STORAGE_CONTAINER_NAME || "market-hub-images";

const blobServiceClient = BlobServiceClient.fromConnectionString(AZURE_STORAGE_CONNECTION_STRING);

const uploadToAzure = async (file) => {
    try {
        const containerClient = blobServiceClient.getContainerClient(CONTAINER_NAME);

        // Ensure container exists
        await containerClient.createIfNotExists({ access: 'blob' });

        const blobName = "images/" + Date.now().toString() + "-" + file.originalname;
        const blockBlobClient = containerClient.getBlockBlobClient(blobName);

        await blockBlobClient.uploadData(file.buffer, {
            blobHTTPHeaders: { blobContentType: file.mimetype }
        });

        return {
            url: blockBlobClient.url,
            key: blobName
        };
    } catch (error) {
        console.error("Azure Storage Error:", error.message);
        throw error;
    }
};

module.exports = { uploadToAzure };
