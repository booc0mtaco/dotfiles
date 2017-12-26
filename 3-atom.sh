#!/bin/bash

# This script should be used to set up the atom editor (atom.io).
# Installed here are plugins, themes, and other settings related to atom:
# - Settings include things from the ~/.atom directory
# - Plugins/themes include packages to be registered via `apm`

FILE=`basename "$0"`
mkdir -p ~/.dotfiles

if [ -e ~/.dotfiles/.hasrun_atom_$(stat -f "%Sm" -t "%s" $FILE) ]
then
    echo "Atom setup has already run."
    exit -2
fi

if [ -e ~/.dotfiles/.hasrun_brew_$(stat -f "%Sm" -t "%s" 2-brew.sh) ]
then
    echo "Begin atom editor setup . . ."
else
    echo "***"
    echo "***Please run 2-* scripts first!"
    echo "***"
    exit -1
fi

#
# Install atom plugins and themes
#

# App-level enhancements
apm install simple-drag-drop-text
apm install close-on-left
apm install tabs-to-spaces
apm install atom-clock
apm install busy-signal
apm install intentions

# Themes
apm install solarized-dark-ui
apm install solarized-one-dark-syntax
apm install atom-solarized-dark-ui

# JavaScript stuff
apm install atom-ternjs
apm install linter-eslint             # Now, configure atom to use ESLint
apm install autocomplete-modules      # Used to do path searches for ES6 modules
apm install docblockr                 # create JSDoc-compatible documentation blocks

# Source control
apm install git-blame
apm install merge-conflicts

# Stylin' and Profilin'
apm install color-picker
apm install pigments
apm install atom-beautify
apm install color-picker
apm install highlight-selected
apm install minimap
apm install editorconfig
apm install file-icons		      # show individual icons files for file types
apm install line-ending-converter

# Project Management & Structure
apm install emmet
apm install editorconfig
apm install double-tag
apm install highlight-selected

#
# Preserve your sanity
#
apm install highlight-bad-chars

#
# copy over settings to ~/.atom
#

mkdir -p ~/.atom
cp config/.atom/* ~/.atom

killall "Atom" &> /dev/null

echo "***"
echo "*** Atom plugins, themes, and settings have been applied."
echo "***"

touch ~/.dotfiles/.hasrun_atom_$(stat -f "%Sm" -t "%s" $FILE)

exit 0
