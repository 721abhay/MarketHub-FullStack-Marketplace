const express = require("express");
const hubRouter = express.Router();
const sendResponse = require("../utils/responseHelper");

const verticals = [
    { id: 'shopping', name: 'Global Shop', icon: 'shopping_bag', active: true },
    { id: 'luxury', name: 'Luxury Boutique', icon: 'diamond', active: true },
    { id: 'grocery', name: 'Fresh Grocery', icon: 'local_grocery_store', active: true },
    { id: 'finance', name: 'Market Finance', icon: 'account_balance', active: true },
    { id: 'iot', name: 'Smart Home', icon: 'router', active: true },
    { id: 'travel', name: 'Travel Hub', icon: 'flight', active: true },
    { id: 'jobs', name: 'Career Forge', icon: 'work', active: true },
    { id: 'real_estate', name: 'Estate View', icon: 'home', active: true },
    { id: 'health', name: 'Wellness Center', icon: 'health_and_safety', active: true },
];

hubRouter.get("/api/hub/verticals", (req, res) => {
    return sendResponse(res, 200, true, "Verticals fetched", verticals);
});

module.exports = hubRouter;
