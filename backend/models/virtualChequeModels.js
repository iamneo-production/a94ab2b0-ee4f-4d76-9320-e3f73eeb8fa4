const mongoose = require("mongoose");
const schema = mongoose.Schema;
const chequeSchema = new schema({
  _id: {
    type: String,
  },
  email: {
    type: Array,
    required: true,
    default: [String],
  },
  amount: {
    type: Number,
    required: true,
    default: 0,
  },
  bank: {
    type: String,
    required: true,
  },
  closesAt: {
    type: Date,
    required: true,
  },
  claimAfter: {
    type: Date,
    required: true,
    default: Date.now(),
  },
});

module.exports = mongoose.model("Cheque", chequeSchema);
