// Import packages
const express = require('express');
const mongoose = require('mongoose');

//Import files from project

const authRouter = require("./routes/auth");

// Initialization
const PORT = 3000;
const app = express();
const url = 'mongodb+srv://kamrulhasan4947:Hasan4947@cluster0.bv7ta9r.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0'

// middleware
app.use(express.json());
app.use(authRouter);


//DB connection
mongoose
.connect(url)
.then(()=>{
    console.log('mongodb connection successfull')
});


app.listen(PORT, '0.0.0.0', ()=>{
    console.log(`Server is conneted on port: ${PORT}`);
})



