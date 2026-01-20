const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const path = require('path');
require('dotenv').config({ path: path.join(__dirname, '.env') });

const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const sellerRouter = require('./routes/seller');
const productRouter = require('./routes/product');
const userRouter = require('./routes/user');
const aiRouter = require('./routes/ai');
const promoRouter = require('./routes/promo');
const serviceRouter = require('./routes/service');
const hubRouter = require('./routes/hub');
const storageRouter = require('./routes/storage');

const PORT = process.env.PORT || 3000;
const app = express();

const helmet = require('helmet');
const morgan = require('morgan');
const logger = require('./utils/logger');

const { apiLimiter, authLimiter } = require('./middlewares/rateLimit');

// middleware
app.use(helmet()); // Secure HTTP headers
app.use(cors());
app.use(express.json());
app.use(morgan('combined', { stream: { write: message => logger.info(message.trim()) } })); // Log HTTP requests

// Rate Limiting (DDoS Protection)
app.use('/api', apiLimiter); // Apply to all API routes
app.use('/api/signup', authLimiter); // Strict
app.use('/api/signin', authLimiter); // Strict

// DEBUG LOGGER (Legacy wrapper)
app.use((req, res, next) => {
  // logger.info(`${req.method} ${req.url}`); // Handled by morgan
  next();
});
app.use(authRouter);
app.use(adminRouter);
app.use(sellerRouter);
app.use(productRouter);
app.use(userRouter);
app.use(aiRouter);
app.use(promoRouter);
app.use(serviceRouter);
app.use(hubRouter);
app.use(storageRouter);

// Test route
app.get('/', (req, res) => {
  res.send('MarketHub Server is running!');
});

// Connections
console.log('Attempting to connect to MongoDB...');
console.log('DB URL:', process.env.DB ? 'Connection string found' : 'NO CONNECTION STRING!');

mongoose
  .connect(process.env.DB, {
    retryWrites: false, // Recommended for Cosmos DB
  })
  .then(() => {
    console.log("✅ Azure Cosmos DB / MongoDB Connection Successful");
  })
  .catch((e) => {
    console.error("❌ Database Connection Error:", e.message);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`🚀 Server running at http://192.168.0.103:${PORT}`);
});

// Global Error Handler
app.use((err, req, res, next) => {
  logger.error(`${err.status || 500} - ${err.message} - ${req.originalUrl} - ${req.method} - ${req.ip}`);
  res.status(err.status || 500).json({
    success: false,
    message: err.message || 'Internal Server Error',
  });
});
