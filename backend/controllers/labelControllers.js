const Label = require("../models/labelModels");

// post label
const createLabel = async (req, res) => {
  const {
    _acctn,
    label_name,
    labelAmt,
    currentAmt,
    label_type,
    transaction_labels,
  } = req.body;
  try {
    const label = await Label.create({
      _acctn,
      label_name,
      labelAmt,
      currentAmt,
      label_type,
      transaction_labels,
    });
    res.status(200).json({ message: "successfully created label", label });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// get labels
const getLabel = async (req, res) => {
  const { id } = req.params;
  const labelData = await Label.find({ acctn: { id } });
  if (!labelData) {
    res
      .status(404)
      .json({ error: "no labels created yet please create a label" });
  }
  res.status(200).json(labelData);
};

// update current amt

const updateLabel = async (req, res) => {
  const { id } = req.params;
  const updateLabel = await Label.findOneAndDelete({
    _acctn: id,
  });
  if (!updateLabel) {
    res.status(404).json({
      error: "no labels present at this acct kindly check the acctn ",
    });
  }
  res.status(200).json({ success: "amount updated", updateLabel });
};

module.exports = {
  createLabel,
  getLabel,
  updateLabel,
};
