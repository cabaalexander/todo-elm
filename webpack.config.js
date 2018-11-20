const HtmlWebpackPlugin = require('html-webpack-plugin');
const path = require('path');

module.exports = {

  mode: 'development',

  entry: {
    app: [
      './src/index.js',
    ],
  },

  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].js',
  },

  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader:  'elm-webpack-loader?verbose=true&debug=true&warn=true',
      }
    ]
  },

  plugins: [

    new HtmlWebpackPlugin({ template: 'src/index.html' }),

  ],

  devServer: {
    host: '0.0.0.0',
    port: 8000,
  },

};
