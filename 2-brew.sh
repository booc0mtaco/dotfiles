#!/bin/bash

# This file is responsible for setting up the tools and resources via home brew (http://brew.sh)
# It assumes the init script has already been run, which installs system-wide dependencies and
# such. Checks for .hasrun_init in home directory.

if [ -e ~/.hasrun_brew ]
then
    echo "Homebrew setup has already run. To re-run, remove ~/.hasrun_brew ."
    exit -2
fi

if [ -e ~/.hasrun_init ]
then
    echo "Installing brew scripts . . ."
else
    echo "***"
    echo "***Please run 1-* scripts first!"
    echo "***"
    exit -1
fi

brew update
brew upgrade --all

# homebrew enhancements
brew tap caskroom/cask     # install desktop apps via command line
brew tap homebrew/versions # install different versions of commandline tools, etc.
brew tap caskroom/versions # install different versions of apps
brew tap caskroom/fonts    # install custom fonts via command line

#
# CLI Section
#

# command line / shell tools
brew install ack		    # intelligent text search through files
brew install tmux		    # replacement for screen. sessions for shells
brew install tree		    # see the contents of a directory structure
brew install wget		    # retrieve files from the internet

brew install fish		    # alternative CLI shell for the 90s!

# Source Control
brew install git		    # distributed source control tool
brew install git-flow		    # methodology for managing branches and development
brew install tig		    # command line tool for viewing commit history

# development tools
brew install node		    # all-encompassing JavaScript VM

#
# GUI / Desktop App Section
#

# Editors
brew cask install atom		     # Text editor built on web technologies
brew cask install cool-retro-term    # make your screen look/feel like an old CRT
brew cask install macdown	     # edit markdown files and preview them live

# Desktop Tools
brew cask install caffeine	     # keep your computer awake with one click
brew cask install spectacle	     # manage keyboard shortcuts to move windows about
brew cask install quicksilver	     # old-school launcher and manager for system behaviors
brew cask install xquartz	     # open Source compositing engine 
brew cask install itsycal	     # system level calendar in a nice little icon

# Finder enhancements
brew cask install qlmarkdown	     # QuickLook : markdown files
brew cask install qlstephen	     # Quicklook : text files of different sorts
brew cask install suspicious-package # Quicklook : view inside zip files before opening them

# Image Tools
brew cask install imageoptim	     # Optimize JPEG / PNG images

# Programming Tools
brew cask install gitup		     # Alternative Git GUI
brew cask install sourcetree	     # Alternative Git GUI

# Browsers
brew cask install firefox	     # Mozilla browser using Gecko
brew cask install google-chrome	     # Google browser using Blink

# Fonts
brew cask install font-fira-code
brew cask install font-fira-mono

echo "***"
echo "*** Installed brew packages successfully"
echo "*** Symlinked commands: apm, atom.sh, macdown, stree"
echo "***"

touch ~/.hasrun_brew

exit 0
