#!/bin/bash

# This script installs the tools and files necessary to bootstrap the rest of the system
# things like homebrew and such get installed here. Everything that can be wrapped will 
# be wrapped, and installed in a shell script named after the wrapper:
# - all brew installations happen in 2-brew.sh
# - node packages installed via 2-node.sh
# - etc.
# The numbering serves as a mnenonic for the order things get run in

# Install homebrew ! (http://brew.sh)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Copy configuration files into their proper places
cp config/* ~

# Once everything is done, drop a little file in the home directory to say so
touch ~/.hasrun_init

