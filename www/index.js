const http = require("http");
const express = require("express");
const app = express();
const httpService = http




const host = "0.0.0.0";
const port = 6721;




app.all("/", function(req, res) {
    res.sendFile("index.html", { root: __dirname });
});


app.all("/about", function(req, res) {
    res.sendFile("pages/about.html", { root: __dirname });
});

app.all("/debug/http", function(req, res){
    console.log(http)
    console.log("Express: \n" + express)
    res.status(200).send("Logging");
  });
app.all("/debug/data", function(req, res){
    console.log(req)
    console.log(res)
    res.status(200).send("Logging");
  });

app.all("*", function(req, res){
    res.status(404).send("Chameleon Page Not Found");
  });


app.listen(port, async function() {
    console.log(`Listening on http://${host}:${port}`); 
});