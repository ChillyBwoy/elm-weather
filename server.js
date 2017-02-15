const proxy = require('express-http-proxy');

const app = require('express')();

app.use('/api', proxy('api.darksky.net/', {
  https: true,
  forwardPath(req, res) {
    return require('url').parse(req.url).path;
  },
  intercept(rsp, data, req, res, callback) {
    res.header('Access-Control-Allow-Origin' , '*');
    res.header('Content-Type', 'application/json');
    const json = data.toString('utf8');
    callback(null, json);
  }
}));

app.listen(8001, () => {
});
