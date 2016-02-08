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

# Themes
apm install solarized-dark-ui
apm install solarized-one-dark-syntax
apm install solarized-seti-ui
apm install atom-solarized-dark-ui

# JavaScript stuff
apm install jshint
apm install atom-ternjs

# Source control
apm install git-blame
apm install git-plus

# Stylin' and Profilin'
apm install color-picker
apm install pigments
apm install atom-beautify
apm install color-picker

# Fun (?)
apm install activate-power-mode

# Project Management & Structure
apm install project-manager
apm install emmet
apm install editorconfig

#
# copy over settings to ~/.atom
#

mkdir -p ~/.atom
cp config/.atom/* ~/.atom

echo "***"
echo "*** Atom plugins, themes, and settings have been applied."
echo "***"

touch ~/.hasrun_atom

exit 0
