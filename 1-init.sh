#!/usr/bin/env bash

# This script installs the tools and files necessary to bootstrap the rest of the system
# things like homebrew and such get installed here. Everything that can be wrapped will 
# be wrapped, and installed in a shell script named after the wrapper:
# - all brew installations happen in 2-brew.sh
# - node packages installed via 2-node.sh
# - etc.
# The numbering serves as a mnenonic for the order things get run in

CHECKOUT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
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
fi

# Install homebrew ! (http://brew.sh)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Prepare option to copy files with prefix '.'
shopt -s dotglob

# copy Script Apps (JXA) to /Applications
cp -R jxa/*.app /Applications

# Link config files from config/ to ~
$CHECKOUT_DIR/utils/apply_dotfiles.sh .tmux.conf
$CHECKOUT_DIR/utils/apply_dotfiles.sh .vimrc
$CHECKOUT_DIR/utils/apply_dotfiles.sh .gitconfig
$CHECKOUT_DIR/utils/apply_dotfiles.sh .tigrc

# setup for fish shell config
$CHECKOUT_DIR/utils/apply_fish_functions.sh dir.fish
$CHECKOUT_DIR/utils/apply_fish_functions.sh nvm.fish
$CHECKOUT_DIR/utils/apply_fish_functions.sh fuck.fish
$CHECKOUT_DIR/utils/apply_fish_functions.sh ack.fish
$CHECKOUT_DIR/utils/apply_fish_functions.sh top.fish

# Once everything is done, drop a little file in the home directory to say so
touch ~/.dotfiles/.hasrun_init_$(stat -f "%Sm" -t "%s" $FILE)

echo "Initialization completed successfully."

exit 0
