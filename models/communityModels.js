const mongoose = require("mongoose");
const schema = mongoose.Schema;
const communitySchema = new schema({
  name: {
    type: String,
    required: true,
  },
  description: { type: String, required: true },
  members: [
    {
      name: String,
      _acctn: String,
    },
  ],
  amt: {
    type: Number,
    required: true,
  },
  invested: [
    {
      _acctn: String,
      amount: String,
    },
  ],
});

module.exports = mongoose.model("Community", communitySchema);
