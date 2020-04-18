
### References
  * [Responsible JavaScript: Part II](https://alistapart.com/article/responsible-javascript-part-2/)
  * [Node & NPM Webpack Cheat Sheet](https://devinduct.com/cheatsheet/16/webpack)
  * [Annotated webpack 4 Config](https://nystudio107.com/blog/an-annotated-webpack-4-config-for-frontend-web-development)
  * [annotated-webpack-4-config](https://github.com/nystudio107/annotated-webpack-4-config)
  * [webpack-dev-server](https://survivejs.com/webpack/developing/webpack-dev-server/)
  * [Lazy Loading | webpack](https://webpack.js.org/guides/lazy-loading/)
  * [Webpack 4 course - I-VIII - Marcin Wanago Blog](https://wanago.io/2018/08/06/webpack-4-course-part-six-increasing-development-experience/)


### Basic setup

Install webpack:

``` sh
  $> npm install webpack webpack-cli --save-dev
```


### Scripts

Add useful scripts to your `package.json`:

``` js
    scripts: {
      "webpack-dev": "webpack --mode=development",
      "webpack-prod": "webpack --mode=production",
      "webpack-watch": "webpack --watch"
    }
```


### Webpack Config

Create `webpack.config.js` file and add teh following:

``` js
    const path = require('path');

    module.exports = {
      // watch: true, we can enable watch via config too
      // mode: 'production', we can change the mode via config too
      entry: './src/my-entry-file.js',

      // will create a single bundle public/my-bundle-name.js file @compile
      output: {
        path: path.resolve(__dirname, 'public'),
        filename: 'my-bundle-name.js'
      }
    };
```

### Multiple Entry Points

For multiple entry points, edit `webpack.config.js` with the following:

``` js
    const path = require('path');

    module.exports = {
      entry: {
        home: './src/home.js',
        contact: './src/contact.js'
      },

      // will create separate public/home.js and public/contact.js dist files
      output: {
        path: path.resolve(__dirname, 'public'),
        filename: '[name].js'
      }
    };
```

### Loaders - babel

Install `babel`:

``` sh
    $> npm install @babel/core babel-loader @babel/preset-env --save-dev
```

Add `babel` setup to the `webpack.config.js`:

``` js
    module.exports = {
      ...
      module: {
        rules: [{
          test: /\.js$/,
          exclude: /node_modules/,
          use: {
            loader: "babel-loader"
          }
        }]
      }
    };
```


Add a `.babelrc` for any `babel` config/options:

``` js
    {
      "presets": ["@babel/env"]
    }
```


### Loaders - css

Install `css` loaders:

``` sh
    $> npm install css-loader style-loader --save-dev
```


Add `css` rules to the `webpack.config.js`:

``` js
    module.exports = {
      ...
      module: {
        rules: [{
          test: /\.css$/,
          use: ['style-loader', 'css-loader']
        }]
      }
    };

```


Now, this will enable the use of CSS styles within JS files by importing into
the JS as follows:

``` js
    import './styles.css'
```


### Loader - images

Install any Images loader-plugins:

``` sh
    $> npm install url-loader --save-dev
```


Update the `webpack.config.js`:

``` js
    module.exports = {
      ...
      module: {
        rules: [{
          test: /\.(png|jp(e*)g|svg|gif)$/,
          use: [{
            loader: 'url-loader',
            options: {
            limit: 8000, // Convert images smaller than 8kb to base64 strings
              name: 'images/[hash]-[name].[ext]'
            }
          }]
        }]
      }
    };
```


### Plugins - `html webpack plugin`

`html-webpack-plugin` is a Plugin that simplifies the creation of HTML files to serve your bundles. It provides hooks to extend it w/additional functionality. [See here.](https://github.com/jantimon/html-webpack-plugin)


Install related plugin libs:

``` js
    $> npm install html-webpack-plugin
```

Update the `plugins` object in the `webpack.config.js`

``` js
    const HtmlWebpackPlugin = require('html-webpack-plugin');

    module.exports = {
        plugins: [
            new HtmlWebpackPlugin()
        ]
    };
```


### Plugins - `copy webpack plugin`

Install related plugin libs:

``` sh
    $> npm install copy-webpack-plugin --save-dev
```


Update the `webpack.config.js`:

``` js
    const CopyWebpackPlugin = require('copy-webpack-plugin');

    module.exports = {
      ...
      plugins: [
        new CopyWebpackPlugin([
          { from: './src/images', to: 'images' }
        ])
      ]
    };
```


### Dev Server

``` sh
    $> npm install webpack-dev-server --save-dev
```

Add/Update the `package.json` scripts:

``` js
    "scripts": {
        "build": "webpack",
        "start": "webpack-dev-server"
    }
```

Add additional functionality by updating `webpack.config.js` as below example:

``` js
    module.exports = {

      devServer: {
        // Display only errors to reduce the amount of output.
        stats: "errors-only",

        // Parse host and port from env to allow customization.
        //
        // If you use Docker, Vagrant or Cloud9, set
        // host: "0.0.0.0";
        //
        // 0.0.0.0 is available to all network devices
        // unlike default `localhost`.
        host: process.env.HOST, // Defaults to `localhost`
        port: process.env.PORT, // Defaults to 8080
        open: true, // Open the page in browser
      },

      ...
    };
```

Enable Error Overlays by updating the `devServer` object in `webpack.config.js`


``` js
    module.exports = {
      devServer: {
        overlay: true,
      },
    };
```

Note: consider adding [error-overlay-webpack-plugin](https://www.npmjs.com/package/error-overlay-webpack-plugin) for even better error origin.


### Tree Shaking
  * ... tbd
  * [webpack guide - Tree Shaking](https://webpack.js.org/guides/tree-shaking/)
  * [wanago - Tree Shaking](https://wanago.io/2018/08/13/webpack-4-course-part-seven-decreasing-the-bundle-size-with-tree-shaking/)


### Code Splitting
  * [webpack guide - Code Splitting](https://webpack.js.org/guides/code-splitting/)
  * [webpack guide - Lazy Loading](https://webpack.js.org/guides/lazy-loading/)
  * [wanago - Code Splitting w/SplitChunksPlugin](https://wanago.io/2018/06/04/code-splitting-with-splitchunksplugin-in-webpack-4/)
  * [wanago - Dynamic Imports](https://wanago.io/2018/08/20/webpack-4-course-part-eight-dynamic-imports-with-prefetch-and-preload/)
  * w/`Entry Points`
  * w/`SplitChunksPlugin`
  * w/`Dynamic Imports`



