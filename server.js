const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const tokenRoutes = require("./routes/tokenRoutes");
const transactionRoutes = require("./routes/transactionRoutes");
const balanceRoutes = require("./routes/balanceRoutes");
const app = express();
require("dotenv").config();
app.use(express.json());
app.use((req, res, next) => {
  next();
});
//
app.use(cors());

// routes
app.use("/api/token", tokenRoutes);
app.use("/api/getbalance", balanceRoutes);
app.use("/api/transaction", transactionRoutes);

// connect
mongoose.connect(process.env.URI).then(() => {
  app.listen(process.env.PORT, () => {
    console.log("server started", process.env.PORT);
  });
});
