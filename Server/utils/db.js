import pg from 'pg';
import dotenv from 'dotenv';

dotenv.config(); 

const db = new pg.Client({
  connectionString: process.env.POSTGRES_URL,
  ssl: {
    rejectUnauthorized: false,
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
