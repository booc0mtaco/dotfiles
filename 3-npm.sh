#!/bin/bash

# Set up npm global packages . This depends on node being installed. 

if [ -e ~/.hasrun_npm ]
then
    echo "NPM packages have already been set up. To re-run, remove ~/.hasrun_npm ."
    exit -2
fi

if [ -e ~/.hasrun_brew ]
then
    echo "Installing NPM global packages . . ."
else
    echo "Level 2 commands have not been run yet!"
    exit -1
fi 

# Install the NPM parts we want to be globally accessible 

npm install -g coffeelint     # Linter for CoffeeScript
apm install linter-coffeelint # Now, we can install a tool in Atom. . .

echo "***"
echo "*** NPM global scripts have been successfully installed."
echo "*** Review README.md to fun post-install commands, if necessary!"
echo "***"

touch ~/.hasrun_npm 
