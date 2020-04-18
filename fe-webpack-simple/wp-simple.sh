
# setup the folder structures, create the files and
#   create the project config (package.json)
sh ./wp-simple-setup.sh

# install the project libraries, tools, and build dependencies
sh ./wp-simple-install.sh

# generate the webpack.config.js files from the component parts
#   in this script
sh ./wp-simple-config.sh

# manually add the scripts in this file to appropriate section
#   of package.json
sh ./wp-simple-package.sh
