#!/bin/bash

# This script installs the tools and files necessary to bootstrap the rest of the system
# things like homebrew and such get installed here. Everything that can be wrapped will 
# be wrapped, and installed in a shell script named after the wrapper:
# - all brew installations happen in 2-brew.sh
# - node packages installed via 2-node.sh
# - etc.
# The numbering serves as a mnenonic for the order things get run in

FILE=`basename "$0"`
mkdir -p ~/.dotfiles
mkdir -p ~/.cache/vim

if [ -e ~/.dotfiles/.hasrun_init_$(stat -f "%Sm" -t "%s" $FILE) ]
then
    echo "Dotfiles have already been initialized."
    exit -2
else
    echo "***"
    echo "***Initializing Setup . . ."
    echo "***"
    
    # clean up old files if we're running this again
fi

# Install homebrew ! (http://brew.sh)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install NVM for node virtual environments
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

# Copy configuration files into their proper places
shopt -s dotglob

# copy Script Apps (JXA) to /Applications
cp -R jxa/*.app /Applications

# Once everything is done, drop a little file in the home directory to say so
touch ~/.dotfiles/.hasrun_init_$(stat -f "%Sm" -t "%s" $FILE)

. ~/.bash_profile

echo "Initialization completed successfully."

exit 0
