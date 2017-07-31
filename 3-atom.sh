#!/bin/bash

# This script should be used to set up the atom editor (atom.io).
# Installed here are plugins, themes, and other settings related to atom:
# - Settings include things from the ~/.atom directory
# - Plugins/themes include packages to be registered via `apm`

if [ -e ~/.hasrun_atom ]
then
    echo "Atom setup has already run. To re-run, remove ~/.hasrun_atom ."
    exit -2
fi

if [ -e ~/.hasrun_brew ]
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
apm install auto-update-packages
apm install simple-drag-drop-text
apm install close-on-left
apm install tabs-to-spaces
apm install atom-clock

# Themes
apm install solarized-dark-ui
apm install solarized-one-dark-syntax
apm install atom-solarized-dark-ui

# JavaScript stuff
apm install atom-ternjs
apm install linter-eslint             # Now, configure atom to use ESLint

# Source control
apm install git-blame
apm install git-plus
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

# Fun (?)
apm install activate-power-mode

# Project Management & Structure
apm install emmet
apm install editorconfig
apm install double-tag
apm install highlight-selected

#
# copy over settings to ~/.atom
#

mkdir -p ~/.atom
cp config/.atom/* ~/.atom

killall "Atom" &> /dev/null

echo "***"
echo "*** Atom plugins, themes, and settings have been applied."
echo "***"

touch ~/.hasrun_atom

exit 0
