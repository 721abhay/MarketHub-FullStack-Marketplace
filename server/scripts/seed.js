const mongoose = require("mongoose");
const dotenv = require("dotenv");
const path = require("path");
dotenv.config({ path: path.join(__dirname, "..", ".env") });

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

const DB = process.env.DB;

mongoose.connect(DB).then(async () => {
    console.log("Seeding data...");

    // ... (existing seeding logic)

    // 5. Jobs
    await Job.deleteMany({});
    await Job.insertMany([
        { title: "Senior Flutter Engineer", company: "MarketHub Global", location: "Remote", salary: "$140k - $180k", type: "Full-time" },
        { title: "AI Research Scientist", company: "DeepMind", location: "London", salary: "£100k+", type: "Full-time" }
    ]);

    // 6. Properties
    await Property.deleteMany({});
    await Property.insertMany([
        { title: "Modern Skyline Penthouse", location: "New York, NY", price: 4500000, type: "Sale", image: "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&q=80&w=400" },
        { title: "Lakeside Luxury Villa", location: "Lake Como, Italy", price: 12000, type: "Rent", image: "https://images.unsplash.com/photo-1613490493576-7fde63acd811?auto=format&fit=crop&q=80&w=400" }
    ]);

    // 7. Health Consultations
    await Consultation.deleteMany({});
    await Consultation.insertMany([
        { doctorName: "Dr. Elena Rossi", specialty: "Neurologist", experience: "20 Years", fee: 150, image: "https://images.unsplash.com/photo-1559839734-2b71f1e59816?auto=format&fit=crop&q=80&w=400" },
        { doctorName: "Dr. James Smith", specialty: "General Physician", experience: "12 Years", fee: 80, image: "https://images.unsplash.com/photo-1622253692010-333f2da6031d?auto=format&fit=crop&q=80&w=400" }
    ]);

    console.log("Seeding complete!");
    process.exit();
}).catch(err => {
    console.error("Seeding failed:", err);
    process.exit(1);
});
