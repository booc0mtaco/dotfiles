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

brew update                # update any existing brew packages (for re-runs)
brew upgrade --all         # also upgrade any packages

# homebrew enhancements
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

brew install vim		    # Install the latest version of VIM
pip install --upgrade pip setuptools

# Alternative command shells
brew install fish		    # alternative CLI shell for the 90s!

# Source Control
brew install git		    # distributed source control tool
brew uninstall git-flow		    # remember to remove the now-dead git-flow project
brew install git-flow-avh	    # methodology for managing branches and development
brew install tig		    # command line tool for viewing commit history

brew install diff-so-fancy          # alternative diff viewer. https://github.com/so-fancy/diff-so-fancy

brew install thefuck                # Fix your last command because you cannot type !

# The fuck requires some configuration. Set up is here
echo "eval (thefuck --alias | tr '\n' ';')" | cat >> ~/.config/fish/config.fish

# Set up diff-so-fancy to run with every diff call
git config --global pager.diff "diff-so-fancy | less --tabs=4 -RFX"
git config --global pager.show "diff-so-fancy | less --tabs=4 -RFX"

# Recommended coloring updates for diff-so-fancy
git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

# development tools
brew install node		    # all-encompassing JavaScript VM
brew cask install hyperterm         # Electron-based terminal emulator

## and set some NPM values
npm set init.author.email "booc0mtaco@gmail.com"
npm set init.author.name "Andrew Holloway"
npm set init.license "MIT"

#
# GUI / Desktop App Section
#

# Editors
brew cask install atom		     # Text editor built on web technologies
brew cask install cool-retro-term    # make your screen look/feel like an old CRT
brew cask install macdown	     # edit markdown files and preview them live
brew cask install typora             # Edit markdown files without split views

# Desktop Tools
brew cask install xquartz	     # open Source compositing engine
brew cask install licecap	     # GIF image capture tool
brew cask install mactracker         # tool that lets you see all the details of all macs ever

# Drivers
brew cask install xbox360-controller-driver

# ... and those that should start up by default ...
brew cask install clipmenu           # Keep track of your clipboard items with a menu bar app
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Applications/ClipMenu.app", hidden:true, name:"ClipMenu"}'

brew cask install caffeine	     # keep your computer awake with one click
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Applications/Caffeine.app", hidden:true, name:"Caffeine"}'

brew cask install spectacle	     # manage keyboard shortcuts to move windows about
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Applications/Spectacle.app", hidden:true, name:"Spectacle"}'

brew cask install itsycal	     # system level calendar in a nice little icon
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Applications/Itsycal.app", hidden:true, name:"Itsycal"}'

brew cask install shiori             # tool to pull in and use bookmarks from pinboard
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Applications/Shiori.app", hidden:true, name:"Shiori"}'

brew cask install alfred             # tool similar to quicksilver but so much more
osascript -e 'tell application "Alfred 3" to make login item at end with properties {path:"~/Applications/Alfred 3.app", hidden:true, name:"Alfred 3"}'

brew cask install lacona             # another quick launcher with support for natural language
osascript -e 'tell application "Lacona" to make login item at end with properties {path:"/Application/Lacona.app", hidden:true, name:"Lacona"}'

# Security Tools
brew cask install blockblock
open /usr/local/Caskroom/blockblock/0.9.4/BlockBlock_Installer.app

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
brew cask install sourcetree	     # Alternative Git GUI
brew cask install gitkraken          # Alternative Git GUI

# Browsers
brew cask install firefox	     # Mozilla browser using Gecko
brew cask install google-chrome	     # Google browser using Blink

# Fonts
brew cask install font-fira-code
brew cask install font-fira-mono

# Fun
brew cask install openemu	     # Open Emulator

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
echo "*** Remember to set up HyperTerm with Fira Code, and packages:"
echo "*** hyperterm-close-on-left,"
echo "*** hyperterm-solarized-dark,"
echo "*** hyperterm-blink, and"
echo "*** hyperborder"
echo "***"

touch ~/.hasrun_brew

exit 0
