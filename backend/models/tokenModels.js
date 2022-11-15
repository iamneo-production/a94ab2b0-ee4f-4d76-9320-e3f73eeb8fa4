const mongoose = require("mongoose");
const schema = mongoose.Schema;

const tokenSchema = new schema(
  {
    _acctn: {
      type: String,
      required: true,
    },
    polygon_acct: {
      type: String,
      required: true,
    },
    redeemToken: {
      type: Number,
      required: false,
    },
    tokenBalance: {
      type: Number,
      required: false,
    },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Token", tokenSchema);
