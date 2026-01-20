const admin = require("firebase-admin");

// Note: In production, you should use a service account JSON file
// or environment variables for these values.
const firebaseConfig = {
    projectId: process.env.FIREBASE_PROJECT_ID,
    clientEmail: process.env.FIREBASE_CLIENT_EMAIL,
    privateKey: process.env.FIREBASE_PRIVATE_KEY?.replace(/\\n/g, '\n'),
};

if (firebaseConfig.projectId && firebaseConfig.clientEmail && firebaseConfig.privateKey) {
    admin.initializeApp({
        credential: admin.credential.cert(firebaseConfig),
    });
    console.log("✅ Firebase Admin Initialized");
} else {
    console.warn("⚠️ Firebase Admin credentials missing. Social login may not work.");
}

module.exports = admin;
