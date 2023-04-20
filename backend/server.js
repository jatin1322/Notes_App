const express= require('express');
const app=express();
// home route
app.get("/",function(req,res){
    res.send("This is a home back");

});

// notes route

app.get("/notes",function(req,res){
    res.send("This is a Notes Page");

});

app.listen(5000,function(){
    console.log("Server Started");
});
