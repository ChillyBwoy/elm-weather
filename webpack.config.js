const path = require('path');

module.exports = {
  entry: './src/index.js',

  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js'
  },

  module: {
    rules: [
      {
        test: /\.elm/,
        use: [
          {
            loader: 'elm-webpack-loader',
            options: {
              verbose: true,
              warn: true
            }
          }
        ]
      }, {
        test: /\.html$/,
        use: [
          {
            loader: 'file-loader?name=[name].[ext]'
          }
        ]
      }
    ]
  },

  devServer: {
    inline: true,
    stats: {
      colors: true
    }
  }
}
