const path = require('path');

module.exports = {
  mode: "production",
  entry: "./src/index.js",
  output: {
    path: path.resolve(__dirname, 'public'),  // ✅ 正しい書き方
    filename: "bundle.js",
  },
  devServer: {
    static: {
      directory: path.resolve(__dirname, 'public'), // ✅ 絶対パスを使う
    },
    compress: true,
    port: 9000,
    open: true,
  },
  resolve: {
    extensions: [".js", ".glsl", "vs", "fs"],
  },
  module: {
    rules: [
      {
        test: /\.(html)$/,
        use: ["html-loader"],
      },
      {
        test: /\.css$/,
        use: ["style-loader", "css-loader"],
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: ["babel-loader"],
      },
      {
        test: /\.(jpg|png|gif|svg)$/,
        type: "asset/resource",
        generator: {
          filename: "assets/images/[hash][ext]",
        },
      },
      {
        test: /\.(glsl|vs|fs|vert|frag)$/,
        type: "asset/source",
      },
    ],
  },
};
