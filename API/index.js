const cors = require('cors');

const express = require('express');
const mongoose = require('mongoose');
const mongoString = process.env.MONGO_DB_URL;
const port = process.env.PORT || 3001;


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


app.listen(port,() => {
    console.log(`Server Started at ${port}`)
})

const routes = require('./routes/routes.js');
app.use('/parking', routes)

module.exports = {
    database,
    collection
};
