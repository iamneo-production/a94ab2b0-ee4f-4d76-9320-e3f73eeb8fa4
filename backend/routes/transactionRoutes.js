const express = require("express");
const router = express.Router();
const {
  createTransactionLog,
  getTransactionLog,
} = require("../controllers/transactionControllers");

router.post("/", createTransactionLog);
router.get("/:id", getTransactionLog);

module.exports = router;
