require('./index.html');

const Elm = require('./Main.elm');
const $main = document.getElementById('main');

const app = Elm.Main.embed($main);
