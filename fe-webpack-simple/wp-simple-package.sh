
# ----------------------------------------------------------------------
# TODO: Add all scripts to handle FE basic functions:
#   - image minimization
#   -
#   - css purging
#   - css minifying
#   - scss compile-to-css
#   -
#   - eslint: js-linting
#   - prettier: js-prettifying
#   - testing: js-tests
#   - js minifying
#   - js tree-shaking
#   -
#   - etc ..
#   -


# ----------------------------------------------------------------------
# TODO: stringify this config for use later
# TODO: Add the following 'scripts' to package.json
#
# Scripts
#  - Add useful scripts to your `package.json`:
# ``` js
#     scripts: {
#       "webpack-dev": "webpack --mode=development",
#       "webpack-prod": "webpack --mode=production",
#       "webpack-watch": "webpack --watch"
#     }
# ```


# ----------------------------------------------------------------------
# TODO: stringify this config for use later
# TODO: DEVSERVER-SCRIPTS .. add to package.json scripts
#
# --- Add/Update the `package.json` scripts:
# ---
# --- ``` js
# ---     "scripts": {
# ---         "build": "webpack",
# ---         "start": "webpack-dev-server"
# ---     }
# --- ```
# ..



# ----------------------------------------------------------------------
# EXAMPLE:
# ..
# Update the 'scripts' in package.json
#   1 - manually add the following scripts to package.json
#   2 - 'echo' to the user to update this manually
# ..
IFS='' read -r -d '' PKGSCRIPTS <<'EOF'
  "scripts": {
    "scss": "node-sass --output-style compressed -o dist/css src/scss",
    "serve": "browser-sync start --server --files 'dist/css/*.css, **/*.html'",
    "watch:css": "onchange 'src/scss' -- npm run scss",
    "start": "run-p serve watch:css"
  }
EOF

