const { Timestamp } = require('mongodb');
const mongoose = require('mongoose');
require("dotenv").config();

const dataSchema = new mongoose.Schema({
    name: {
        required: true,
        type: String
    },
    brand: {
        required: true,
        type: String
    },
    color: {
        required: true,
        type: String
    },
    plate: {
        required: true,
        type: String
    },
    arrivingTimeStamp: {
        required: true,
        type: Date
    },
    doorNum: {
        required: true,
        type: Number
    },
    module: {
        required: true,
        type: String
    },
},
{
    collection:'EntraceRegister',
    versionKey: false
});

module.exports = mongoose.model('EntraceRegister', dataSchema)