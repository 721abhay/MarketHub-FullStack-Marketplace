/**
 * Standardized API response helper
 * @param {Object} res - Express response object
 * @param {number} status - HTTP status code
 * @param {boolean} success - Operation success status
 * @param {string} message - Response message
 * @param {any} data - Response data (optional)
 */
const sendResponse = (res, status, success, message, data = null) => {
    return res.status(status).json({
        success,
        message,
        data,
    });
};

module.exports = sendResponse;
