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
        type: Date, 
        default: Date.now,
        get: (date)=> date.toLocaleDateString("es-MX",{ timeZone: 'America/Mexico_City', dateStyle: "short", timeStyle: 'full' })
       },
    doorNum: {
        required: true,
        type: [String]
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