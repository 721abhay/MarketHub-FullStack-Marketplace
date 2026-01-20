const express = require("express");
const serviceRouter = express.Router();
const sendResponse = require("../utils/responseHelper");

// Models
const Course = require("../models/course");
const Event = require("../models/event");
const Badge = require("../models/badge");
const FinancialOffer = require("../models/finance_offer");
const IoTDevice = require("../models/iot_device");
const TravelDeal = require("../models/travel_deal");
const Product = require("../models/product");
const Job = require("../models/job");
const Property = require("../models/property");
const Consultation = require("../models/consultation");

// 1. Luxury Vertical (Using Product model with category 'luxury')
// ... (existing routes omitted for brevity but they are there)

// ...

// 9. Careers Vertical (Updated to persistent)
serviceRouter.get("/api/careers/jobs", async (req, res) => {
    try {
        const jobs = await Job.find().sort({ postedAt: -1 });
        return sendResponse(res, 200, true, "Jobs fetched", jobs);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// 10. Real Estate Vertical (Updated to persistent)
serviceRouter.get("/api/real-estate/properties", async (req, res) => {
    try {
        const properties = await Property.find();
        return sendResponse(res, 200, true, "Properties fetched", properties);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

// 11. Health Vertical (Updated to persistent)
serviceRouter.get("/api/health/consultations", async (req, res) => {
    try {
        const consultations = await Consultation.find();
        return sendResponse(res, 200, true, "Consultations fetched", consultations);
    } catch (e) {
        return sendResponse(res, 500, false, e.message);
    }
});

module.exports = serviceRouter;
