const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const tokenRoutes = require("./routes/tokenRoutes");
const tokenTransactionRoutes = require("./routes/tokenTransactionRoutes");
const balanceRoutes = require("./routes/balanceRoutes");
const chequeRoutes = require("./routes/chequeRoutes");
const labelRoutes = require("./routes/labelRouter");
const transactionRoutes = require("./routes/transactionRoutes");
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
app.use("/api/tokentransfer", tokenTransactionRoutes);
app.use("/api/virtualcheque/", chequeRoutes);
app.use("/api/labels/", labelRoutes);
app.use("/api/transaction/", transactionRoutes);

// connect
mongoose.connect(process.env.URI).then(() => {
  app.listen(process.env.PORT, () => {
    console.log("server started", process.env.PORT);
  });
});
