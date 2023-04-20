const express= require('express');
const app=express();

const mongoose = require('mongoose');

const Note=require("./models/Note");
mongoose.connect("mongodb+srv://Jatin:admin@cluster0.n3btd0y.mongodb.net/?retryWrites=true&w=majority").then(function(){

app.get("/",function(req,res){
    res.send("This is a changes");

});

// notes route

app.get("/notes/list",async function(req,res){
    var notes=await Note.find();
    res.json(notes);
});

app.get("/notes/add",async function(req,res){
    const newNote=new Note({
        id: "0002",
        userid: "usedid",
        title: "First Note",
        content: "This is my content"
    });

    await newNote.save();

    const response=  {message : "new note created"};
    res.json(response);
});

});
// home route


app.listen(5000,function(){
    console.log("Server Started");
});
