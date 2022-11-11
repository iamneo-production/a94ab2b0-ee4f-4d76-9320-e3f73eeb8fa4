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

  // get single label from _acctn
  const labelData = await Label.findOne({ _acctn: id });
  if (!labelData) {
    res.status(400).json({ message: "no label found" });
  } else {
    res.status(200).json({ labelData });
  }
};

// update current amt

const updateLabel = async (req, res) => {
  const { id } = req.params;

  const { currentAmt } = req.body;
  const labelData = await Label.findOneAndUpdate(
    { _acctn: id },
    { currentAmt },
    { new: true }
  );
  if (!labelData) {
    res
      .status(404)
      .json({ error: "no labels created yet please create a label" });
  }
  res.status(200).json(labelData);
};

module.exports = {
  createLabel,
  getLabel,
  updateLabel,
};
