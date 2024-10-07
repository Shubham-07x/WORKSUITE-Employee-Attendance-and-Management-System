import express from "express";
import cors from 'cors';
import { adminRouter } from "./Routes/AdminRoute.js";
import { employeeRouter } from "./Routes/EmployeeRoute.js";
import jwt from "jsonwebtoken";
import cookieParser from "cookie-parser";

const app = express();

// Middleware
app.use(cors({
    origin: "https://worksuite-employee-attendance-and-management-system.vercel.app", // Allow requests from this origin
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'], // Allow specified methods
    credentials: true // Allow credentials (cookies, authorization headers, etc.)
}));

// Preflight request handling
app.options('*', cors()); // Handle preflight requests for all routes

app.use(express.json()); // Parse JSON bodies
app.use(cookieParser()); // Parse cookies
app.use(express.static('Public')); // Serve static files from the Public directory

// Middleware to verify user authentication
const verifyUser = (req, res, next) => {
    const token = req.cookies.jwt; // Get token from cookies
    if (!token) {
        return res.status(401).json({ Status: false, Error: "Not Authenticated" });
    }

    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
        if (err) {
            return res.status(403).json({ Status: false, Error: "Invalid Token" });
        }
        
        req.role = decoded.role; // Attach user role to the request object
        req.id = decoded.id; // Attach user ID to the request object
        next();
    });
};

// Routes
app.use('/auth', adminRouter); // Admin routes
app.use('/employee', employeeRouter); // Employee routes

app.get('/', (req, res) => {
    res.send('Backend is running'); // Basic route to check server status
});

// Verify route
app.get('/verify', verifyUser, (req, res) => {
    return res.json({ Status: true, role: req.role, id: req.id }); // Return user role and ID if verified
});

// Start server
const port = process.env.PORT || 3000; // Set port
app.listen(port, () => {
    console.log(`Server is running on port ${port}`); // Log server start
});
