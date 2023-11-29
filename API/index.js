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

database.once('connected', async () => {
    console.log('Database Connected');

    try {
        const pingResult = await mongoose.connection.db.admin().ping();
        if (pingResult.ok === 1) {
            console.log('Ping successful');
        } else {
            console.error('Database ping failed');
        }
    } catch (error) {
        console.error('Error during database ping', error);
    }
});

const app = express();
app.use(express.json());
app.use(cors());


app.listen(port,() => {
    console.log(`Server Started at ${port}`)
})

const routes = require('./routes/routes.js');
app.use('/parking', routes)

app.get('/ping', (req, res) => {
    res.sendStatus(200)
  })

module.exports = {
    database,
};
