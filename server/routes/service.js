const express = require("express");
const serviceRouter = express.Router();

// MOCK DATA for Phase 5 Middle Screens integration
// In a real production app, these would be separate Collections in MongoDB

const travelDeals = {
    flights: [
        { id: 'f1', from: 'Mumbai', to: 'New York', price: 850, date: '2024-06-15', airline: 'AirHub', logo: 'https://images.unsplash.com/photo-1436491865332-7a61a109c055?auto=format&fit=crop&q=80&w=100' },
        { id: 'f2', from: 'London', to: 'Tokyo', price: 920, date: '2024-07-20', airline: 'GlobalSky', logo: 'https://images.unsplash.com/photo-1544016768-982d1554f0b9?auto=format&fit=crop&q=80&w=100' },
    ],
    buses: [
        { id: 'b1', from: 'Pune', to: 'Goa', price: 25, type: 'Luxury Sleeper', rating: 4.8, operator: 'Royal Travels' },
        { id: 'b2', from: 'Bangalore', to: 'Chennai', price: 18, type: 'Volvo AC', rating: 4.5, operator: 'CityLink' },
    ],
    trains: [
        { id: 't1', name: 'Rajdhani Express', from: 'Delhi', to: 'Mumbai', price: 45, time: '12:30 PM' },
        { id: 't2', name: 'Shatabdi Express', from: 'Chennai', to: 'Bangalore', price: 30, time: '06:00 AM' },
    ]
};

const homeServices = [
    { id: 's1', title: 'Plumbing', price: 49, rating: 4.9, image: 'https://images.unsplash.com/photo-1504148455328-497c5ef215d0?auto=format&fit=crop&q=80&w=200' },
    { id: 's2', title: 'Electrical Repair', price: 59, rating: 4.7, image: 'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?auto=format&fit=crop&q=80&w=200' },
    { id: 's3', title: 'Deep Cleaning', price: 129, rating: 4.8, image: 'https://images.unsplash.com/photo-1581578731548-c64695ce6958?auto=format&fit=crop&q=80&w=200' },
];

const jobs = [
    { id: 'j1', title: 'Senior Flutter Developer', company: 'TechHub', location: 'Remote', salary: '$120k - $160k', type: 'Full-time' },
    { id: 'j2', title: 'Product UI Designer', company: 'DesignCo', location: 'New York', salary: '$90k - $130k', type: 'Contract' },
];

const properties = [
    { id: 'p1', title: 'Modern 3BHK Apartment', location: 'Beverly Hills, CA', price: 2500000, type: 'Sale', image: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&q=80&w=400' },
    { id: 'p2', title: 'Luxury Villa with Pool', location: 'Miami, FL', price: 15000, type: 'Rent', image: 'https://images.unsplash.com/photo-1613490493576-7fde63acd811?auto=format&fit=crop&q=80&w=400' },
];

const healthConsultations = [
    { id: 'd1', name: 'Dr. Sarah Wilson', specialty: 'Cardiologist', experience: '15 Years', rating: 4.9, fee: 80, image: 'https://images.unsplash.com/photo-1559839734-2b71f1e59816?auto=format&fit=crop&q=80&w=200' },
    { id: 'd2', name: 'Dr. Michael Chen', specialty: 'Dermatologist', experience: '10 Years', rating: 4.8, fee: 65, image: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?auto=format&fit=crop&q=80&w=200' },
];

// ROUTES
serviceRouter.get("/api/travel/deals", (req, res) => {
    res.json(travelDeals);
});

serviceRouter.get("/api/services/home", (req, res) => {
    res.json(homeServices);
});

serviceRouter.get("/api/careers/jobs", (req, res) => {
    res.json(jobs);
});

serviceRouter.get("/api/real-estate/properties", (req, res) => {
    res.json(properties);
});

serviceRouter.get("/api/health/consultations", (req, res) => {
    res.json(healthConsultations);
});

module.exports = serviceRouter;
