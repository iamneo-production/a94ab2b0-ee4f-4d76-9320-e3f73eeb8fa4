const Transactions = require("../models/transactionModels");

// post label
const createTransactionLog = async (req, res) => {
  const { _acctn, name, Amt, transaction_type, label_type } = req.body;
  try {
    const transactionLog = await Transactions.create({
      _acctn,
      name,
      Amt,
      transaction_type,
      label_type,
    });
    res.status(200).json({
      message: "successfully created transaction Log",
      transactionLog,
    });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// get labels
const getTransactionLog = async (req, res) => {
  const { id } = req.params;
  const transactionData = await Transactions.find({ acctn: { id } });
  if (!transactionData) {
    res.status(404).json({ error: "no transactions made yet" });
  }
  res.status(200).json(transactionData);
};

module.exports = {
  createTransactionLog,
  getTransactionLog,
};
