const { BlobServiceClient } = require('@azure/storage-blob');
const { ComputerVisionClient } = require('@azure/cognitiveservices-computervision');
const { ApiKeyCredentials } = require('@azure/ms-rest-js');

// 1. Azure Blob Storage Configuration
const AZURE_STORAGE_CONNECTION_STRING = process.env.AZURE_STORAGE_CONNECTION_STRING;
let blobServiceClient;
if (AZURE_STORAGE_CONNECTION_STRING) {
    blobServiceClient = BlobServiceClient.fromConnectionString(AZURE_STORAGE_CONNECTION_STRING);
}

// 2. Azure AI Vision Configuration
const AZURE_VISION_KEY = process.env.AZURE_VISION_KEY;
const AZURE_VISION_ENDPOINT = process.env.AZURE_VISION_ENDPOINT;
let visionClient;
if (AZURE_VISION_KEY && AZURE_VISION_ENDPOINT) {
    visionClient = new ComputerVisionClient(
        new ApiKeyCredentials({ inHeader: { 'Ocp-Apim-Subscription-Key': AZURE_VISION_KEY } }),
        AZURE_VISION_ENDPOINT
    );
}

module.exports = {
    blobServiceClient,
    visionClient
};
