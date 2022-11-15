"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
require("dotenv").config();
process.env.NODE_ENV = process.env.NODE_ENV || "development";
console.log(process.env.MONGODB_URI, process.env.JWT_SECRET);
exports.default = {
    port: 8080,
    databaseURL: process.env.MONGODB_URI
        ? process.env.MONGODB_URI
        : "mongodb://localhost:27017",
    jwtSecret: process.env.JWT_SECRET,
    api: {
        prefix: "/api",
    },
};
//# sourceMappingURL=index.js.map