const cors = require('cors');

const express = require('express');
const mongoose = require('mongoose');
const mongoString = process.env.MONGO_DB_URL;

const database = async () => {
    try {
        mongoose.set('strictQuery', false);
        await mongoose.connect(mongoString, {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        });
        console.log('MongoDB Connected...');
    } catch (err) {
        console.error(err.message);
        // make the process fail
        process.exit(1);
    }
}

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
};



