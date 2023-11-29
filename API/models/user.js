const { Timestamp } = require('mongodb');
const mongoose = require('mongoose');
require("dotenv").config();

const dataSchema = new mongoose.Schema({
    name: {
        required: true,
        type: String
    },
    brand: {
        required: false,
        type: String
    },
    color: {
        required: false,
        type: String
    },
    plate: {
        required: false,
        type: String
    },
    arrivingTimeStamp: {
        required: true,
        type: Date, 
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