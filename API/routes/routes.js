const express = require('express');
const router = express.Router()

const model = require("../models/user");
const url = process.env.MONGO_DB_URL
const { default: mongoose } = require('mongoose');
module.exports = router;
require("dotenv").config()

const userTable = mongoose.model("User", model.User)

router.post('/registerUser', async (req, res) => {
    const data = new userTable({
        name: req.body.name,
        age: req.body.age,
        lastName: req.body.lastName,
        mail: req.body.mail,
        phone: req.body.phone
    })
    try {
        const result = await data.save();
        res.send(result).status(204);
    }
    catch (error) {
        res.status(400).json({message: error.message})
    }
})

const multer = require("multer");
const { GridFsStorage } = require("multer-gridfs-storage");
// Create a storage object with a given configuration
const storage = new GridFsStorage({
  url,
  file: (req, file) => {
      return {
        bucketName: "User_Photo",
        filename: `${Date.now()}_${file.originalname}`,
      };
  },
});

// Set multer storage engine to the newly created object
const upload = multer({ storage });

router.post("/upload/image", upload.single("profile"), (req, res) => {
  const file = req.file;
  // Respond with the file details
  res.send({
    message: "Uploaded",
    id: file.id,
    name: file.filename,
    contentType: file.contentType,
  });
});