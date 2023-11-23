const express = require("express");
const router = express.Router();
const model = require("../models/user");
const { default: mongoose } = require('mongoose');
const { Int32 } = require("mongodb");
require("dotenv").config();

const userTable = mongoose.model("EntraceRegister", model.User);

router.post('/register', async (req, res) => {
    const data = new userTable({
        name: req.body.name.toLocaleLowerCase(),
        brand: req.body.brand.toLocaleLowerCase(),
        color: req.body.color.toLocaleLowerCase(),
        plate: req.body.plate.toLocaleLowerCase(),
        arrivingTimeStamp: req.body.arrivingTimeStamp,
        doorNum: req.body.doorNum,
        module: req.body.module.toLocaleLowerCase()
    });
    try {
        const result = await data.save();
        res.send(result).status(204);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
});

router.get("/entraceRegister", async (req, res) => {
    const doorNum = req.query.doorNum;
    const timestamp = new Date(req.query.arrivingTime);

    try {
        let result = await userTable.find({
            doorNum: doorNum,
            arrivingTimeStamp: { $gte: timestamp }
        });

        if (!result || result.length === 0) {
            res.status(200).send("Empty");
        } else {
            res.status(200).send(result);
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});

router.get("/plateRecord", async (req, res) => {
    const plate = req.query.plate.toLocaleLowerCase();
    const timestamp = new Date();
    timestamp.setHours(0);
    timestamp.setMinutes(0);
    timestamp.setSeconds(0);
    console.log(timestamp);
    try {
        let result = await userTable.find({
            plate: plate,
            arrivingTimeStamp: { $gte: timestamp }
        });

        if (!result || result.length === 0) {
            res.status(200).send(result);
        } else {
            res.status(200).send(result);
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});

router.put("/entraceRegister/update", async (req, res) => {
    const plate = req.query.plate; // Extracting plate from the query parameters

    try {
        const result = await userTable.findOneAndUpdate(
            { plate: plate },
            {
                name: req.body.name.toLocaleLowerCase(),
                brand: req.body.brand.toLocaleLowerCase(),
                color: req.body.color.toLocaleLowerCase(),
                arrivingTimeStamp: req.body.arrivingTimeStamp,
                doorNum: req.body.doorNum,
                module: req.body.module.toLocaleLowerCase()
            },
            { new: true } // Return the modified document
        );

        if (!result) {
            res.status(404).send("Not found");
        } else {
            res.status(200).send(result);
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});

router.delete("/entraceRegister/delete", async (req, res) => {
    const plate = req.query.plate;

    try {
        const result = await userTable.findOneAndDelete({ plate: plate });

        if (!result) {
            res.status(404).send("Not found");
        } else {
            res.status(204).send();
        }
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});



module.exports = router;
