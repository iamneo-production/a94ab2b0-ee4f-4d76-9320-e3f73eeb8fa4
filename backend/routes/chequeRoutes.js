const express = require("express");
const {
  createCheque,
  getClaimCheque,
} = require("../controllers/chequeController");

const router = express.Router();
router.post("/", createCheque);
router.get("/:id", getClaimCheque);
module.exports = router;
