const rateLimit = require('express-rate-limit');

// General API limiter (Applied to all routes)
const apiLimiter = rateLimit({
    windowMs: 15 * 60 * 1000, // 15 minutes
    max: 100, // Limit each IP to 100 requests per windowMs
    standardHeaders: true, // Return rate limit info in the `RateLimit-*` headers
    legacyHeaders: false, // Disable the `X-RateLimit-*` headers
    message: {
        status: 429,
        error: "Too many requests, please try again later."
    }
});

// Stricter limiter for Auth routes (Brute force protection)
const authLimiter = rateLimit({
    windowMs: 60 * 60 * 1000, // 1 hour
    max: 10, // Limit each IP to 10 login/signup attempts per hour
    message: {
        status: 429,
        error: "Too many login attempts, please try again after an hour."
    }
});

module.exports = { apiLimiter, authLimiter };
