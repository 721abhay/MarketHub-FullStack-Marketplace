const axios = require('axios');

/**
 * Azure AI Vision Utility
 */
const analyzeImage = async (imageBuffer) => {
    const endpoint = process.env.AZURE_VISION_ENDPOINT;
    const key = process.env.AZURE_VISION_KEY;

    if (!endpoint || !key) {
        throw new Error("Azure Vision credentials not configured in .env");
    }

    try {
        const response = await axios.post(
            `${endpoint}/vision/v3.2/analyze?visualFeatures=Categories,Description,Objects,Tags`,
            imageBuffer,
            {
                headers: {
                    'Ocp-Apim-Subscription-Key': key,
                    'Content-Type': 'application/octet-stream'
                }
            }
        );

        return response.data;
    } catch (error) {
        console.error("Azure Vision Error:", error.response ? error.response.data : error.message);
        throw error;
    }
};

module.exports = { analyzeImage };
