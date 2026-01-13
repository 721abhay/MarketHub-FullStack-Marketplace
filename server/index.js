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

const PORT = process.env.PORT || 3000;
const app = express();

// middleware
app.use(cors());
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(sellerRouter);
app.use(productRouter);
app.use(userRouter);
app.use(aiRouter);
app.use(promoRouter);

// Test route
app.get('/', (req, res) => {
  res.send('MarketHub Server is running!');
});

// Connections
console.log('Attempting to connect to MongoDB...');
console.log('DB URL:', process.env.DB ? 'Connection string found' : 'NO CONNECTION STRING!');

mongoose
  .connect(process.env.DB)
  .then(() => {
    console.log("✅ MongoDB Connection Successful");
  })
  .catch((e) => {
    console.log("❌ MongoDB Connection Error:");
    console.log(e.message);
    console.log('\nNote: Sign-in will not work without a valid MongoDB connection.');
    console.log('Please add your MongoDB connection string to server/.env file');
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`🚀 Server running at http://192.168.0.103:${PORT}`);
});
