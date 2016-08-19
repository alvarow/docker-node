var express = require('express');

// Constants
var PORT = 8080;

// App
var app = express();
app.get('/*', function (req, res) {
  res.send('It Works!!\n');
  console.log('It Works!! Path Hit: ' + req.url);
});

app.listen(PORT);
console.log('Running on http://localhost:' + PORT);
