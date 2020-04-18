
# ----------------------------------------------------------------------
# TODO: ADD the following functionality
#   * [ ] Building and minifying HTML, CSS and assets
#   * [ ] Live reloading
#   * [ ] Code splitting
#   * [X] Transpiling Javascript
#   * [X] Running a local server
#
# ..
# `refs: minify-links`
# * [Production | webpack](https://webpack.js.org/guides/production/)
# * [MiniCssExtractPlugin | webpack](https://webpack.js.org/plugins/mini-css-extract-plugin/#minimizing-for-production)
# * [Uglify vs. Babel-minify vs. Terser: A mini battle royale - LogRocket Blog](https://blog.logrocket.com/uglify-vs-babel-minify-vs-terser-a-mini-battle-royale/)
# * [Minifying](https://survivejs.com/webpack/optimizing/minifying/)
# * [Loading Images](https://survivejs.com/webpack/loading/images/)
# * [babel-minify-webpack-plugin - npm](https://www.npmjs.com/package/babel-minify-webpack-plugin)
# * [andywer/webpack-blocks: 📦 Configure webpack using functional feature blocks.](https://github.com/andywer/webpack-blocks)


# ----------------------------------------------------------------------
# EXAMPLE: storing long strings in a variable
# ..
IFS='' read -r -d '' PKGSCRIPTS <<'EOF'
  "scripts": {
    "scss": "node-sass --output-style compressed -o dist/css src/scss",
    "serve": "browser-sync start --server --files 'dist/css/*.css, **/*.html'",
    "watch:css": "onchange 'src/scss' -- npm run scss",
    "start": "run-p serve watch:css"
  }
EOF


# ----------------------------------------------------------------------
# TODO: stringify this config for use later
#
IFS='' read -r -d '' WP_CONFIG_HEAD <<'EOF'
const path = require('path');

// require plugins
const HtmlWebpackPlugin = require('html-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

module.exports = {
EOF


# ----------------------------------------------------------------------
# TODO: stringify this config for use later
#
IFS='' read -r -d '' WP_CONFIG_TAIL <<'EOF'

};
EOF


# ----------------------------------------------------------------------
# TODO: stringify this config for use later
# TODO: Add this `entry`/`output` setup for single-entry apps
#
IFS='' read -r -d '' WP_SINGLE_ENTRYDIST <<'EOF'
  // watch: true, we can enable watch via config too
  // mode: 'production', we can change the mode via config too
  entry: './src/my-entry-file.js',

  // will create a single bundle public/my-bundle-name.js file @compile
  output: {
    path: path.resolve(__dirname, 'public'),
    filename: 'my-bundle-name.js'
  },
EOF


# ----------------------------------------------------------------------
# TODO: stringify this config for use later
# TODO: Add this `entry`/`output` setup for multiple-entry apps
#
# Multiple Entry Points
#   - For multiple entry points, edit `webpack.config.js` with the following:
#
IFS='' read -r -d '' WP_MULTI_ENTRYDIST <<'EOF'
  entry: {
    home: './src/home.js',
    contact: './src/contact.js'
  },

  // will create separate public/home.js and public/contact.js dist files
  output: {
    path: path.resolve(__dirname, 'public'),
    filename: '[name].js'
  },
EOF


# ----------------------------------------------------------------------
# LOADERS_CONFIG_HEAD
#   - add snippet-open for adding loader configs
IFS='' read -r -d '' LOADERS_CONFIG_HEAD <<'EOF'
  module: {
    rules: [
EOF


# ----------------------------------------------------------------------
# TODO: stringify this config for use later
# TODO: Add `babel` setup to the `webpack.config.js`:
#
IFS='' read -r -d '' BABEL_LOADER <<'EOF'
    {
      test: /\.js$/,
      exclude: /node_modules/,
      use: {
        loader: "babel-loader"
      }
    },
EOF


# ----------------------------------------------------------------------
# TODO: stringify this config for use later
# TODO: LOADERS: CSS-LOADER and STYLE-LOADER .. add plugin config to webpack.config.js
#   - Add rules to the `webpack.config.js`:
#
IFS='' read -r -d '' CSS_STYLES_LOADER <<'EOF'
    {
      test: /\.css$/,
      use: ['style-loader', 'css-loader']
    },
EOF


# ----------------------------------------------------------------------
# TODO: stringify this config for use later
# TODO: LOADER: Images URL-LOADER .. add plugin config to webpack.config.js
#   - Update the `webpack.config.js`:
#
IFS='' read -r -d '' IMAGES_LOADER <<'EOF'
    {
      test: /\.(png|jp(e*)g|svg|gif)$/,
      use: [{
        loader: 'url-loader',
        options: {
          limit: 8000, // Convert images smaller than 8kb to base64 strings
          name: 'images/[hash]-[name].[ext]'
        }
      }]
    },
EOF


# ----------------------------------------------------------------------
# LOADERS_CONFIG_HEAD
#   - add snippet-close for the loader configs
IFS='' read -r -d '' LOADERS_CONFIG_TAIL <<'EOF'
    ]
  },

EOF


# ----------------------------------------------------------------------
# TODO: stringify this config for use later
# TODO: HTML-WEBPACK-PLUGIN .. add plugin config to webpack.config.js
# TODO: COPY-WEBPACK-PLUGIN .. add plugin config to webpack.config.js
#   - Update the `plugins` object in the `webpack.config.js`
#
IFS='' read -r -d '' PLUGINS_CONFIG <<'EOF'
  plugins: [
    new HtmlWebpackPlugin(),
    new CopyWebpackPlugin([
      { from: './src/images', to: 'images' }
    ])
  ],

EOF


# ----------------------------------------------------------------------
# TODO: stringify this config for use later
# TODO: DEVSERVER-CONFIG .. add to webpack.config.js
#
# --- Add additional functionality by updating `webpack.config.js` as below example:
# ---
IFS='' read -r -d '' DEVSERVER_CONFIG <<'EOF'
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
    host: process.env.HOST,   // Defaults to `localhost`
    port: process.env.PORT,   // Defaults to 8080
    open: true,               // Open the page in browser
    overlay: true,            // enable error overlays
  },

EOF



# ----------------------------------------------------------------------
# TODO: Better Error-Overlays
# NOTE: consider adding [error-overlay-webpack-plugin](https://www.npmjs.com/package/error-overlay-webpack-plugin) for even better error origin.
# ..


# ----------------------------------------------------------------------
# NOTE: CSS-in-JS capability
# NOTE: Usage in JS files
#
# Now, this will enable the use of CSS styles within JS files by importing into
# the JS as follows:
#
# --- ``` js
# ---     import './styles.css'
# --- ```


# ----------------------------------------------------------------------
# TODO: stringify this config for use later
# TODO: `.babelrc` contents
#
# Add this to the `.babelrc`:
#
IFS='' read -r -d '' BABELRC_CONFIG <<'EOF'
{
  "presets": ["@babel/env"]
}
EOF


