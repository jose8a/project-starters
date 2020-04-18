
# ----------------------------------------------------------------------
# default-name for project
PROJDIR=wp-project-simple
mkdir $PROJDIR && cd $PROJDIR


# ----------------------------------------------------------------------
# initialize project config
# ..
echo ""
echo " .... initializing project and package.json config"
npm init -y


# ----------------------------------------------------------------------
# add .gitignore
# ..
echo ""
echo " .... creating .gitignore"
touch .gitignore && echo "node_modules" >> .gitignore


# ----------------------------------------------------------------------
# TODO: create a `.babelrc` for any `babel` configs/options:
echo ""
echo " .... creating .babelrc"
touch .babelrc


# ----------------------------------------------------------------------
# CREATE: Webpack Config
#   - Create `webpack.config.js` file and add either the
#     single-entry or the multiple-entry config to this file
# ..
echo ""
echo " .... creating webpack.config.js"
touch webpack.config.js


# ----------------------------------------------------------------------
# set up folder-structures:
#   1 - create src-folder
#   2 - create src-subfolders
#   3 - return to project root
# ..
mkdir src && cd src
mkdir js scss images icons
cd ../


# ----------------------------------------------------------------------
# generate basic index.html content
#   1 - create index/entry file
#   2 - 'echo' basic index-html structure into the file
#       \--> [How to assign a heredoc value to a variable in Bash?](https://stackoverflow.com/questions/1167746/how-to-assign-a-heredoc-value-to-a-variable-in-bash/1655389#1655389)
# ..
touch index.html
IFS='' read -r -d '' INDEX <<'EOF'
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <meta http-equiv="X-UA-Compatible" content="ie=edge" />
      <title>Project starter</title>
      <link rel="stylesheet" type="text/css" href="dist/css/styles.css" />
    </head>
    <body>
      <h1>Hello world!</h1>
    </body>
  </html>
EOF

echo "$INDEX" >> index.html


# ----------------------------------------------------------------------
# generate basic scss-sources folder structure
#   1 - create src/scss/styles.scss file
#   2 - create sub-folders and base-files under src/scss
#       \--> [Modern FE Workflow: SCSS Architecture](https://css-irl.info/a-modern-front-end-workflow-part-3/)
# ..
touch src/scss/styles.scss
cd src/scss

mkdir config && cd config
touch _variables.scss
touch _functions.scss
touch _mixins.scss
cd ../

mkdir base && cd base
touch _resets.scss
touch _typography.scss
touch _forms.scss

mkdir objects && cd objects
touch _buttons.scss
cd ../

mkdir globals && cd globals
touch _header.scss
touch _footer.scss
touch _layout.scss
cd ../

mkdir components
mkdir utilities
cd ../../

