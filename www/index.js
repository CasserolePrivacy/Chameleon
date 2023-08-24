const http = require('http');
const express = require('express')
const app = express()
let indexFile;




const host = "0.0.0.0";
const port = 6721;




app.all('/', function(req, res) {
    res.sendFile('index.html', { root: __dirname });
})


app.all('/about', function(req, res) {
    res.sendFile('pages/about.html', { root: __dirname });
})


app.all('*', function(req, res){
    res.status(404).send('Chameleon Page Not Found');
  });


app.listen(port, function() {
    console.log(`Listening on http://${host}:${port}`); 
});