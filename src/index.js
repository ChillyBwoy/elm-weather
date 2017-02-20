require('./html/index.html');
require('./css/style.css');

const Elm = require('./elm/Main.elm');
const $main = document.getElementById('main');

const app = Elm.Main.embed($main);
