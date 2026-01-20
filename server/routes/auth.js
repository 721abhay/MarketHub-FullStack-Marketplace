const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const { OAuth2Client } = require("google-auth-library");
const admin = require("../utils/firebaseConfig");
const authRouter = express.Router();
const client = new OAuth2Client(process.env.GOOGLE_CLIENT_ID);

const sendResponse = require("../utils/responseHelper");

// SIGN UP
authRouter.post("/api/signup", async (req, res) => {
    try {
        const { name, email, password, type } = req.body;

        // Input Validation
        if (!name || name.trim().length < 2) {
            return sendResponse(res, 400, false, "Please enter a valid name (min 2 chars).");
        }
        if (!email || !/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
            return sendResponse(res, 400, false, "Please enter a valid email address.");
        }
        if (!password || password.length < 6) {
            return sendResponse(res, 400, false, "Password must be at least 6 characters long.");
        }

        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return sendResponse(res, 400, false, "An account with this email already exists.");
        }

        const hashedPassword = await bcryptjs.hash(password, 8);

        let user = new User({
            email,
            password: hashedPassword,
            name,
            type: type || 'user',
        });
        user = await user.save();

        const userData = { ...user._doc };
        delete userData.password;

        return sendResponse(res, 201, true, "Account created successfully!", userData);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Sign In Route
authRouter.post("/api/signin", async (req, res) => {
    try {
        const { email, password } = req.body;

        if (!email || !password) {
            return sendResponse(res, 400, false, "Email and password are required.");
        }

        let user = await User.findOne({ email });
        if (!user) {
            return sendResponse(res, 401, false, "Invalid email or password.");
        }

        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
            return sendResponse(res, 401, false, "Invalid email or password.");
        }

        const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET);

        const userData = { ...user._doc };
        delete userData.password;

        return sendResponse(res, 200, true, "Login successful!", { token, ...userData });
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

authRouter.post("/tokenIsValid", async (req, res) => {
    try {
        const token = req.header("x-auth-token");
        if (!token) return res.json(false);
        const verified = jwt.verify(token, process.env.JWT_SECRET);
        if (!verified) return res.json(false);

        const user = await User.findById(verified.id);
        if (!user) return res.json(false);
        res.json(true);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// get user data
authRouter.get("/", async (req, res) => {
    try {
        const token = req.header("x-auth-token");
        if (!token) return sendResponse(res, 401, false, "No auth token, access denied.");

        const verified = jwt.verify(token, process.env.JWT_SECRET);
        if (!verified) return sendResponse(res, 401, false, "Token verification failed.");

        const user = await User.findById(verified.id);
        if (!user) return sendResponse(res, 404, false, "User not found.");

        const userData = { ...user._doc };
        delete userData.password;

        return sendResponse(res, 200, true, "User data fetched", { ...userData, token: token });
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// Google Login
authRouter.post("/api/google-login", async (req, res) => {
    try {
        const { idToken } = req.body;

        const ticket = await client.verifyIdToken({
            idToken,
            audience: process.env.GOOGLE_CLIENT_ID,
        });

        const { email, name, sub: googleId } = ticket.getPayload();

        let user = await User.findOne({ email });

        if (!user) {
            // Create user if not exists
            user = new User({
                email,
                name,
                password: '', // No password for social login users
                type: 'user',
            });
            user = await user.save();
        }

        const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET);

        const userData = { ...user._doc };
        delete userData.password;

        return sendResponse(res, 200, true, "Google login successful!", { token, ...userData });
    } catch (e) {
        return sendResponse(res, 500, false, "Google verification failed: " + e.message);
    }
});

// Firebase Social Login Bridge
authRouter.post("/api/firebase-login", async (req, res) => {
    try {
        const { idToken } = req.body;

        // 1. Verify Firebase Token
        const decodedToken = await admin.auth().verifyIdToken(idToken);
        const { email, name, picture, uid: firebaseUid } = decodedToken;

        let user = await User.findOne({ email });

        if (!user) {
            // Create user in MongoDB if not exists
            user = new User({
                email,
                name: name || email.split('@')[0],
                password: '', // Social login
                type: 'user',
            });
            user = await user.save();

            // Also ensure user exists in Supabase Auth/DB
            // (Optional sync logic here)
        }

        // Return a consistent session (Token + User Data)
        const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET);

        const userData = { ...user._doc };
        delete userData.password;

        return sendResponse(res, 200, true, "Firebase login successful!", { token, ...userData });
    } catch (e) {
        return sendResponse(res, 500, false, "Firebase Token Verification Failed: " + e.message);
    }
});

module.exports = authRouter;
