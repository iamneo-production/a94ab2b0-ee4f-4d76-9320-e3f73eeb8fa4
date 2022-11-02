const express = require("express");
const {
  createTokenData,
  getTokenData,
  getBalance,
} = require("../controllers/tokenController");
const axiosData = require("../token/tokenBalance");
const router = express.Router();

router.get("/:id", axiosData);

module.exports = router;
