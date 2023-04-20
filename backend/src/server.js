const express= require('express');
const app=express();
const bodyParser=require('body-parser');
app.use(bodyParser.urlencoded({extended: false}));
// if true we can give nested objects
// else cannot

app.use(bodyParser.json());
const mongoose = require('mongoose');
const mongodbpath="mongodb+srv://Jatin:admin@cluster0.n3btd0y.mongodb.net/?retryWrites=true&w=majority";
const Note=require("./models/Note");
mongoose.connect(mongodbpath).then(function(){

app.get("/",function(req,res){
    const response={message:"API working"};
    res.json(response);

});

// notes route
const noteRouter=require('./routes/Note');
app.use("/notes",noteRouter);  // /notes/notes.add

});
// home route

const PORT=process.env.PORT || 5000
app.listen(PORT,function(){
    console.log("Server Started at PORT : "+ PORT);
});
