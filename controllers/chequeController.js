const Cheque = require("../models/virtualChequeModels");

// post
const createCheque = async (req, res) => {
  const { _id, email, amount, bank, closesAt, claimAfter } = req.body;
  try {
    const createCheque = await Cheque.create({
      _id,
      email,
      amount,
      bank,
      closesAt,
      claimAfter,
    });
    res.status(200).json({
      message: "Successfully created virtual cheque",
      createCheque,
    });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// get claim cheque request

const getClaimCheque = async (req, res) => {
  const { id } = req.params;
  const claimData = await Cheque.find({ email: id });
  if (!claimData) {
    res.status(404).json({ error: "You dont have any request" });
  }
  res.status(200).json(claimData);
};

// accept payment

const acceptPayment = async (req, res) => {
  const { id } = req.params;
  const accept = await Cheque.up;
};

module.exports = {
  createCheque,
  getClaimCheque,
};
