const mongoose = require('mongoose');
require("dotenv").config();

const dataSchema = new mongoose.Schema({
    name: {
        required: true,
        type: String
    },
    age: {
        required: true,
        type: Number
    },
    lastName: {
        required: true,
        type: String
    },
    mail: {
        required: false,
        type: String
    },
    phone: {
        required: false,
        type: Number
    },
    photoId: {
        required: false,
        type: String
    }
},{
    collection:'User',
    versionKey: false
});

module.exports = mongoose.model('User', dataSchema)