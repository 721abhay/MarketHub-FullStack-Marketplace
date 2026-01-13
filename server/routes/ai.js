const express = require("express");
const aiRouter = express.Router();
const auth = require("../middlewares/auth");

aiRouter.post("/api/ai/chat", auth, async (req, res) => {
    try {
        const { message } = req.body;
        let response = "";

        const query = message.toLowerCase();

        if (query.includes("order")) {
            response = "I can definitely help with that! You can check your latest order status in the 'Your Orders' section of your profile.";
        } else if (query.includes("shipping") || query.includes("deliver")) {
            response = "MarketHub offers SuperFast delivery! Most orders arrive within 2-3 business days. You'll get a notification as soon as your items ship.";
        } else if (query.includes("return") || query.includes("refund")) {
            response = "We have a hassle-free 7-day return policy. Just go to your order details and select 'Return Item' if you're not satisfied.";
        } else if (query.includes("price") || query.includes("discount")) {
            response = "We always have the best deals! Check out the 'Featured Flash Deals' on the home page for up to 40% off.";
        } else if (query.includes("who are you") || query.includes("help")) {
            response = "I am the MarketHub AI Concierge. I'm here to help you find products, track orders, and answer any questions about our marketplace!";
        } else {
            response = "That's a great question! While I'm still learning, I recommend searching for that using the search bar at the top of the home screen for the best results.";
        }

        res.json({ response });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = aiRouter;
