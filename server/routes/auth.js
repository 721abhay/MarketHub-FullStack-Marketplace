const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const authRouter = express.Router();

// SIGN UP
authRouter.post("/api/signup", async (req, res) => {
    console.log('📝 Signup request received:', req.body.email);
    try {
        const { name, email, password } = req.body;

        const existingUser = await User.findOne({ email });
        if (existingUser) {
            console.log('❌ User already exists:', email);
            return res
                .status(400)
                .json({ msg: "User with same email already exists!" });
        }

        const hashedPassword = await bcryptjs.hash(password, 8);

        let user = new User({
            email,
            password: hashedPassword,
            name,
        });
        user = await user.save();
        console.log('✅ User created successfully:', email);
        res.json(user);
    } catch (e) {
        console.log('❌ Signup error:', e.message);
        res.status(500).json({ error: e.message });
    }
});

// Sign In Route
authRouter.post("/api/signin", async (req, res) => {
    console.log('🔐 Sign-in request received:', req.body.email);
    try {
        const { email, password } = req.body;

        const user = await User.findOne({ email });
        if (!user) {
            console.log('❌ User not found:', email);
            return res
                .status(400)
                .json({ msg: "User with this email does not exist!" });
        }

        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
            console.log('❌ Incorrect password for:', email);
            return res.status(400).json({ msg: "Incorrect password." });
        }

        const token = jwt.sign({ id: user._id }, "passwordKey");
        console.log('✅ Sign-in successful:', email);
        res.json({ token, ...user._doc });
    } catch (e) {
        console.log('❌ Sign-in error:', e.message);
        res.status(500).json({ error: e.message });
    }
});

module.exports = authRouter;
