const mongoose = require("mongoose");
const schema = mongoose.Schema;

const transactionSchema = new schema(
  {
    _acctn: {
      type: String,
      required: true,
    },
    name: {
      type: String,
      required: true,
    },
    Amt: {
      type: Number,
      required: true,
      default: 0,
    },
    transaction_type: {
      type: String,
      required: false,
      default: "debit",
    },
    label_type: {
      type: String,
      required: false,
      default: "",
    },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Transactions", transactionSchema);
