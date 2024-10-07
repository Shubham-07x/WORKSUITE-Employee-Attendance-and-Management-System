import pg from 'pg';
import dotenv from 'dotenv';

dotenv.config(); // Load environment variables from .env file

const db = new pg.Client({
  connectionString: process.env.POSTGRES_URL,
  ssl: {
    rejectUnauthorized: false, // For self-signed certificates; adjust as necessary
  },
});

db.connect()
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((err) => {
    console.error("Error establishing Connection", err);
  });

export default db;
