const cors = require('cors');

const express = require('express');
const mongoose = require('mongoose');
const mongoString = process.env.MONGO_DB_URL;

mongoose.connect(mongoString);
const database = mongoose.connection;
const collection = database.collection("EntraceRegister");
database.on('error', (error) => {
    console.log(error)
})

database.once('connected', () => {
    console.log('Database Connected');
})

const app = express();
app.use(express.json());
app.use(cors());

app.listen()
console.log(`Server Started`)

const routes = require('./routes/routes');
app.use('/parking', routes)

module.exports = {
    database,
    collection
};



