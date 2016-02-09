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
brew cask install xquartz	     # open Source compositing engine

# ... and those that should start up by default ...
brew cask install caffeine	     # keep your computer awake with one click
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Applications/Caffeine.app", hidden:true, name: "Caffeine"}'

brew cask install spectacle	     # manage keyboard shortcuts to move windows about
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Applications/Spectacle.app", hidden:true, name: "Spectacle"}'

brew cask install quicksilver	     # old-school launcher and manager for system behaviors
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Applications/Quicksilver.app", hidden:true, name: "Quicksilver"}'

brew cask install itsycal	     # system level calendar in a nice little icon
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Applications/Itsycal.app", hidden:true, name: "Itsycal"}'


# Finder enhancements
brew cask install qlmarkdown	     # QuickLook : markdown files
brew cask install qlstephen	     # Quicklook : text files of different sorts
brew cask install suspicious-package # Quicklook : view inside zip files before opening them
brew cask install qlcolorcode        # Quicklook : color code ... code
brew cask install quicklook-json     # Quicklook : provide structure to JSON files
brew cask install qlprettypatch      # Quicklook : show patch files with diff information
brew cask install quicklook-csv      # Quicklook : show CSV information in context
brew cask install qlimagesize        # Quicklook : show image metrics and info in context
brew cask install betterzipql        # Quicklook : show contents of zip file before extracting

# Screensavers
brew cask install aerial             # AppleTV screensaver for desktop

# And set up the screensaver . . .
defaults -currentHost write com.apple.screensaver modulePath -string "~/Library/Screen Savers/Aerial.saver"
defaults -currentHost write com.apple.screensaver moduleName -string "Aerial"

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

# Set up the font in Safari, so all monospaced text blocks use it
# Restart Safari.app after setting this
defaults write com.apple.Safari UserStyleSheetEnabled 1
defaults write com.apple.Safari UserStyleSheetLocationURLString "~/.firacode.css"
defaults write com.apple.Safari WebKitUserStyleSheetEnabledPreferenceKey 1
defaults write com.apple.Safari WebKitUserStyleSheetLocationPreferenceKey "~/.firacode.css"
killall "Safari" &> /dev/null
open -a safari

echo "***"
echo "*** Installed brew packages successfully"
echo "*** Symlinked commands: apm, atom.sh, macdown, stree"
echo "***"

touch ~/.hasrun_brew

exit 0
