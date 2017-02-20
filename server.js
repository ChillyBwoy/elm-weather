const proxy = require('express-http-proxy');
const url = require('url');
const express = require('express');

const payload = require('./mock.json');

const app = express();

const DARK_SKY_VERY_SECRET_KEY = '43fcd9de44b4f0ba861d03d7103e2f72';
const PREFIX = `/forecast/${DARK_SKY_VERY_SECRET_KEY}`;

// app.use('/api', proxy('api.darksky.net', {
//   https: true,
//   forwardPath(req, res) {
//     const parsed = url.parse(req.url);
//     return `${PREFIX}${parsed.path}`;
//   },
//   intercept(rsp, data, req, res, callback) {
//     res.header('Access-Control-Allow-Origin' , '*');
//     res.header('Content-Type', 'application/json');
//     const json = data.toString('utf8');
//     callback(null, json);
//   }
// }));

app.use(function(req, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  next();
});

app.get('/api/:location/', (req, res) => {
  res.json(payload);
});

app.listen(8001, () => {
});
