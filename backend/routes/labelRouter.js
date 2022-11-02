const express = require("express");
const router = express.Router();
const {
  createLabel,
  getLabel,
  updateLabel,
} = require("../controllers/labelControllers");

router.post("/", createLabel);
router.get("/:id", getLabel);
router.delete("/:id", updateLabel);
module.exports = router;
