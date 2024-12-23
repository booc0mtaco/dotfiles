#!/usr/bin/env bash

# This script installs the tools and files necessary to bootstrap the rest of the system
# things like homebrew and such get installed here. Everything that can be wrapped will 
# be wrapped, and installed in a shell script named after the wrapper:
# - all brew installations happen in 2-brew.sh
# The numbering serves as a mnenonic for the order things get run in

CHECKOUT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
FILE=`basename "$0"`
mkdir -p ~/.dotfiles
mkdir -p ~/.cache/vim
mkdir -p ~/.config/fish/functions
mkdir -p ~/.config/omf
mkdir -p ~/.config/git

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
brew -v > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "brew already installed. Continuing . . ."; sleep 2;
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install vim-plug
# https://opensource.com/article/20/2/how-install-vim-plugins for more information
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Prepare option to copy files with prefix '.'
shopt -s dotglob

# copy Script Apps (JXA) to /Applications
cp -R jxa/*.app /Applications

# Link config files from config/ to ~
$CHECKOUT_DIR/utils/apply_dotfiles.sh .zprofile
$CHECKOUT_DIR/utils/apply_dotfiles.sh .inputrc
$CHECKOUT_DIR/utils/apply_dotfiles.sh .bash_profile
$CHECKOUT_DIR/utils/apply_dotfiles.sh .aliases
$CHECKOUT_DIR/utils/apply_dotfiles.sh .exports
$CHECKOUT_DIR/utils/apply_dotfiles.sh .tmux.conf
$CHECKOUT_DIR/utils/apply_dotfiles.sh .vimrc
$CHECKOUT_DIR/utils/apply_dotfiles.sh .tigrc
$CHECKOUT_DIR/utils/apply_dotfiles.sh com.googlecode.iterm2.plist

# Copy some config files to equivalent ~/.config subdirectories
# TODO: expand tilde (~) in assignments for zsh
set -o magicequalsubst

SOURCE_DIR="config" DESTINATION_DIR=~/.config/git $CHECKOUT_DIR/utils/apply_config.sh .gitconfig
mv ~/.config/git/.gitconfig ~/.config/git/config

# setup for fish shell config - functions
$CHECKOUT_DIR/utils/apply_fish_functions.sh dir.fish
$CHECKOUT_DIR/utils/apply_fish_functions.sh nvm.fish
$CHECKOUT_DIR/utils/apply_fish_functions.sh fuck.fish
$CHECKOUT_DIR/utils/apply_fish_functions.sh ack.fish
$CHECKOUT_DIR/utils/apply_fish_functions.sh top.fish
$CHECKOUT_DIR/utils/apply_fish_functions.sh tree.fish
$CHECKOUT_DIR/utils/apply_fish_functions.sh speedtest.fish

# setup for fish shell config - oh-my-fish
$CHECKOUT_DIR/utils/apply_omf.sh theme
$CHECKOUT_DIR/utils/apply_omf.sh bundle
$CHECKOUT_DIR/utils/apply_omf.sh channel
$CHECKOUT_DIR/utils/apply_omf.sh init.fish

# Once everything is done, drop a little file in the home directory to say so
touch ~/.dotfiles/.hasrun_init_$(stat -f "%Sm" -t "%s" $FILE)

echo "Initialization completed successfully."

exit 0
