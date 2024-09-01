import pg from "pg";
import dotenv from "dotenv";

const saltRounds = 10;
dotenv.config();

const db = new pg.Client({
  connectionString: process.env.POSTGRES_URL,
  ssl: {
    rejectUnauthorized: false,
  }
});

db.connect(err =>{
    if(err){
        console.log("Error establishing Connection", err);
    } else{
        console.log("Connection Succesfull")
    }
});

export default db;
