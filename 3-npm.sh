#!/usr/bin/env bash

# Set up npm global packages . This depends on node being installed. 

FILE=`basename "$0"`
mkdir -p ~/.dotfiles

if [ -e ~/.dotfiles/.hasrun_npm_$(stat -f "%Sm" -t "%s" $FILE) ]
then
    echo "NPM packages have already been set up."
    exit -2
fi

if [ -e ~/.dotfiles/.hasrun_brew_$(stat -f "%Sm" -t "%s" 2-brew.sh) ]
then
    echo "Installing NPM global packages . . ."
else
    echo "Level 2 commands have not been run yet!"
    exit -1
fi 

# Install the NPM parts we want to be globally accessible 

# Use ESLint : https://github.com/dustinspecker/awesome-eslint
npm install -g eslint
npm install -g eslint-plugin-cocoascript # Dogfooding

echo "***"
echo "*** NPM global scripts have been successfully installed."
echo "*** Review README.md to fun post-install commands, if necessary!"
echo "***"

touch ~/.dotfiles/.hasrun_npm_$(stat -f "%Sm" -t "%s" $FILE)
