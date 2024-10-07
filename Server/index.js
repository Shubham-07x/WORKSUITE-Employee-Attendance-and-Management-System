import express from "express";
import cors from "cors";
import { adminRouter } from "./Routes/AdminRoute.js";
import { employeeRouter } from "./Routes/EmployeeRoute.js";
import jwt from "jsonwebtoken";
import cookieParser from "cookie-parser";

const app = express();

// Middleware
app.use(
  cors({
    origin: ["https://worksuite-employee-attendance-and-management-system.vercel.app"],
    methods: ["GET", "POST", "PUT", "DELETE"],
    credentials: true,
  })
);
app.use(express.json());
app.use(cookieParser());
app.use(express.static("Public"));

// Middleware to verify user authentication
const verifyUser = (req, res, next) => {
  const token = req.cookies.jwt;
  if (!token) {
    return res.status(401).json({ Status: false, Error: "Not Authenticated" });
  }

  jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
    if (err) {
      return res.status(403).json({ Status: false, Error: "Invalid Token" });
    }

    req.role = decoded.role;
    req.id = decoded.id;
    next();
  });
};

// Routes
app.use("/auth", adminRouter);
app.use("/employee", employeeRouter);

app.get("/", (req, res) => {
  res.send("Backend is running");
});

// Verify route
app.get("/verify", verifyUser, (req, res) => {
  return res.json({ Status: true, role: req.role, id: req.id });
});

// Start server
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
