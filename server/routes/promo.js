const express = require("express");
const promoRouter = express.Router();
const auth = require("../middlewares/auth");
const PromoCode = require("../models/promo_code");

promoRouter.post("/api/promo/validate", auth, async (req, res) => {
    try {
        const { code } = req.body;
        const promo = await PromoCode.findOne({ code, isActive: true });

        if (!promo) {
            return res.status(400).json({ msg: "Invalid or expired promo code!" });
        }

        if (promo.expiryDate < new Date().getTime()) {
            return res.status(400).json({ msg: "This promo code has expired!" });
        }

        res.json(promo);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Admin Route to create promo codes
promoRouter.post("/admin/promo/create", auth, async (req, res) => {
    try {
        const { code, discountPercent, maxDiscount, expiryDate } = req.body;
        let promo = new PromoCode({
            code,
            discountPercent,
            maxDiscount,
            expiryDate,
        });
        promo = await promo.save();
        res.json(promo);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = promoRouter;
