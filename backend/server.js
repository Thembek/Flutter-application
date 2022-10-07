const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

//Middleware
const app = express();
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//database connection
require('dotenv').config();
mongoose.connect(process.env.MONGO_URL,
    {
        useNewUrlParser: true,
        useUnifiedTopology: true,
    }    
)
.then(() => {console.log('MongoDB connected successfully.')})
.catch((err) => {console.log(err)});

//database routing
app.use('/', require('./routes/user'));

//listening to Port
app.listen(process.env.PORT, () => {
    console.log(`Server: http://localhost:${process.env.PORT}, is currently running.`);
});