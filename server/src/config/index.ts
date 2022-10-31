require("dotenv").config();

process.env.NODE_ENV = process.env.NODE_ENV || "development";

export default {
  port: process.env.PORT ? parseInt(process.env.PORT) : 8080,
  databaseURL: process.env.MONGODB_URI
    ? process.env.MONGODB_URI
    : "mongodb://localhost:27017",

  jwtSecret: process.env.JWT_SECRET,
  api: {
    prefix: "/api",
  },
};
