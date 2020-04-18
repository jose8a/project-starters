
# ----------------------------------------------------------------------
# INSTALL: Basic setup
#   - Install webpack:
# ..
echo ""
echo " .... installing webpack-cli"
yarn add webpack webpack-cli


# ----------------------------------------------------------------------
# Loaders - babel
#   - Install `babel`:
echo ""
echo " .... installing BABEL loaders"
yarn add @babel/core babel-loader @babel/preset-env


# ----------------------------------------------------------------------
# Loaders - css
#   - Install `css` loaders:
# ..
echo ""
echo " .... installing CSS and STYLE loaders"
yarn add css-loader style-loader


# ----------------------------------------------------------------------
# LOADER: Images
#   - Install any Images loader-plugins:
# ..
echo ""
echo " .... installing IMAGE loaders"
yarn add url-loader


# ----------------------------------------------------------------------
# PLUGIN: HTML-WEBPACK-PLUGIN
#
# Plugins - `html-webpack-plugin`
#   - this is a Plugin that simplifies the creation of HTML files to serve your bundles.
#   - It provides hooks to extend it w/additional functionality.
#   - [See here.](https://github.com/jantimon/html-webpack-plugin)
#
# Install related plugin libs:
echo ""
echo " .... installing HTML-WEBPACK-PLUGIN"
yarn add html-webpack-plugin


# ----------------------------------------------------------------------
# PLUGIN: COPY-WEBPACK-PLUGIN .. add to package.json scripts
#
# Plugins - `copy webpack plugin`
#   - Install related plugin libs:
echo ""
echo " .... installing COPY-WEBPACK-PLUGIN"
yarn add copy-webpack-plugin


# ----------------------------------------------------------------------
# Dev Server Install
#   - Install module
echo ""
echo " .... installing WEBPACK-DEV-SERVER"
yarn add webpack-dev-server



# ----------------------------------------------------------------------
# DONE
echo ""
echo " .... DONE installing webpack modules"


# ----------------------------------------------------------------------
# TODO: FUTURE SETUP ??
# ..
#
# --- ### Tree Shaking
# ---   * ... tbd
# ---   * [webpack guide - Tree Shaking](https://webpack.js.org/guides/tree-shaking/)
# ---   * [wanago - Tree Shaking](https://wanago.io/2018/08/13/webpack-4-course-part-seven-decreasing-the-bundle-size-with-tree-shaking/)
# ---
# ---
# --- ### Code Splitting
# ---   * [webpack guide - Code Splitting](https://webpack.js.org/guides/code-splitting/)
# ---   * [webpack guide - Lazy Loading](https://webpack.js.org/guides/lazy-loading/)
# ---   * [wanago - Code Splitting w/SplitChunksPlugin](https://wanago.io/2018/06/04/code-splitting-with-splitchunksplugin-in-webpack-4/)
# ---   * [wanago - Dynamic Imports](https://wanago.io/2018/08/20/webpack-4-course-part-eight-dynamic-imports-with-prefetch-and-preload/)
# ---   * w/`Entry Points`
# ---   * w/`SplitChunksPlugin`
# ---   * w/`Dynamic Imports`


