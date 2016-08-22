var express = require('express');

// For Docker
process.on('SIGINT', function() { console.log('Got SIGINT... Quitting...'); process.exit(); }); // Ctrl+C
process.on('SIGTERM', function() { console.log('Got SIGTERM ... Quitting...'); process.exit(); }); // docker stop

// App
var app = express();
app.set('port', process.env.npm_package_config_port || 3000);
app.get('/*', function (req, res) {
  res.send('It Works!!\n');
  console.log('It Works!! Path Hit: ' + req.url);
});

app.listen(app.get('port'));
console.log('Running on http://localhost:' + app.get('port'));
console.log(' try it with curl -i http://localhost:' + app.get('port'));
