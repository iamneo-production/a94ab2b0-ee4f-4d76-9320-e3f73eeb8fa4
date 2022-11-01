const Token = require("../models/tokenModels");
const axiosData = require("../token/tokenBalance");

// post
const createTokenData = async (req, res) => {
  const { _acctn, polygon_acct, tokenBalance, redeemToken } = req.body;
  try {
    const token = await Token.create({
      _acctn,
      polygon_acct,
    });
    res.status(200).json(token);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// get a token data

const getTokenData = async (req, res) => {
  const { id } = req.params;
  const tokenData = await Token.find({ _acctn: id });
  if (!tokenData) {
    res.status(404).json({ error: "Your wallet not connected" });
  }
  res.status(200).json(tokenData);
};

// get token balance
const getBalance = (req, res) => {
  res.status(200).json({ message: "ho" });
};

module.exports = {
  createTokenData,
  getTokenData,
  getBalance,
};
