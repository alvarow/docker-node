var express = require('express');

// App
var app = express();
app.set('port', process.env.PORT || 3000);
app.get('/*', function (req, res) {
  res.send('It Works!!\n');
  console.log('It Works!! Path Hit: ' + req.url);
});

app.listen(app.get('port'));
console.log('Running on http://localhost:' + app.get('port'));
