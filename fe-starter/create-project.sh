
# ----------------------------------------------------------------------
# TODO: add functionality to read ONE argument as name of project, and
#       over-ride the "PROJDIR" variable with this argument, if provided
# ..
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
# set default name of project
# ..
PROJDIR=my-project

# ----------------------------------------------------------------------
# initialize an npm project
# ..
mkdir $PROJDIR && cd $PROJDIR

# ----------------------------------------------------------------------
# initialize an npm project
# ..
npm init -y


# ----------------------------------------------------------------------
# add .gitignore
# ..
touch .gitignore && echo "node_modules" >> .gitignore


# ----------------------------------------------------------------------
# install basic dependencies
# node-sass:      scss compiler
# browser-sync:   live-reloading
# onchange:       watches for changes to files to trigger other actions
# npm-run-all:    run npm scripts in parallel or sequentially
# ..
yarn add node-sass browser-sync onchange npm-run-all


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
cd ../

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


# ----------------------------------------------------------------------
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

echo ""
echo ""
echo ""
echo " -------------------------------------------------- "
echo ""
echo "update the scripts in package.json with the following values:"
echo "$PKGSCRIPTS"
echo ""
echo " -------------------------------------------------- "

