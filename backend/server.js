const express= require('express');
const app=express();

const mongoose = require('mongoose');
mongoose.connect("mongodb+srv://Jatin:admin@cluster0.n3btd0y.mongodb.net/?retryWrites=true&w=majority").then(function(){

app.get("/",function(req,res){
    res.send("This is a home back");

});

// notes route

app.get("/notes",function(req,res){
    res.send("This is a Notes Page");

});

});
// home route


app.listen(5000,function(){
    console.log("Server Started");
});
