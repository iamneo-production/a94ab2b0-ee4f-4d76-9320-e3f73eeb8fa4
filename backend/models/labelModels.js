const mongoose = require("mongoose");
const schema = mongoose.Schema;

const labelSchema = new schema(
  {
    _acctn: {
      type: String,
      required: true,
    },
    label_name: {
      type: String,
      required: true,
    },
    labelAmt: {
      type: Number,
      required: true,
      default: 100000,
    },
    currentAmt: {
      type: Number,
      required: false,
      default: 10000,
    },
    label_type: {
      type: String,
      required: false,
      default: "Savings",
    },
    transaction_labels: {
      type: Array,
      required: false,
      default: [],
    },
    visibility: {
      type: Boolean,
      required: false,
      default: true,
    },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Label", labelSchema);
