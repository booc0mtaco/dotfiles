#!/bin/bash

# This file is responsible for setting up the tools and resources via home brew (http://brew.sh)
# It assumes the init script has already been run, which installs system-wide dependencies and
# such. Checks for .hasrun_init in home directory.

FILE=`basename "$0"`
mkdir -p ~/.dotfiles

if [ -e ~/.dotfiles/.hasrun_brew_$(stat -f "%Sm" -t "%s" $FILE) ]
then
    echo "Homebrew setup has already run."
    exit -2
fi

if [ -e ~/.dotfiles/.hasrun_init_$(stat -f "%Sm" -t "%s" 1-init.sh) ]
then
    echo "Installing brew scripts . . ."
else
    echo "***"
    echo "***Please run 1-* scripts first!"
    echo "***"
    exit -1
fi

brew update                # update any existing brew packages (for re-runs)
brew upgrade               # also upgrade any packages

# homebrew enhancements
brew tap caskroom/fonts    # install custom fonts via command line

#
# CLI Section
#

# command line / system / shell tools
brew install ack		    # intelligent text search through files
brew install tmux		    # replacement for screen. sessions for shells
brew install tree		    # see the contents of a directory structure
brew install wget		    # retrieve files from the internet
brew install rename		    # allow for batch renaming operations (util-linux)

brew install vim		    # Install the latest version of VIM

brew cask install osxfuse           # System for handling custom filesystems in userland

# Development tools
brew install httpie                 # Manage HTTP commands easier than with cURL
brew install jq                     # Manipulate JSON data like a baus


# Python
brew install python

# Alternative command shells
brew install fish		    # alternative CLI shell for the 90s!

# Source Control
brew install git		    # distributed source control tool
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

# Shell enhancements
brew install fzf                    # Fuzzy Finder (for bash, zsh, fish)
/usr/local/opt/fzf/install          # Set up right away

# development tools
# Node installed as a part of NVM now
brew cask install hyper             # Electron-based terminal emulator

## and set some NPM values
npm set init.author.email "booc0mtaco@gmail.com"
npm set init.author.name "Andrew Holloway"
npm set init.license "MIT"

#
# GUI / Desktop App Section
#

# Editors
brew cask install visual-studio-code # Text editor built on web technologies
brew cask install cool-retro-term    # make your screen look/feel like an old CRT
brew cask install macdown	     # edit markdown files and preview them live
brew cask install typora             # Edit markdown files without split views

# Desktop Tools
brew cask install xquartz	     # open Source compositing engine
brew cask install licecap	     # GIF image capture tool
brew cask install mactracker         # tool that lets you see all the details of all macs ever
brew cask install diskwave           # view your disk usage in a tabular format
brew cask install disk-inventory-x   # another, but more ugly, way to view your disk usage
brew cask install the-unarchiver     # UnZIP things from many different formats
brew cask install etrecheck          # Check your computer out, and run some diagnostics
brew cask install flycut             # Clipboard manager (in lieu of Alfred's built-in stuff)
brew cask install iina		     # Alternative video player 

# ... and those that should start up by default ...

brew cask install caffeine	     # keep your computer awake with one click
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Applications/Caffeine.app", hidden:true, name:"Caffeine"}'

brew cask install spectacle	     # manage keyboard shortcuts to move windows about

brew cask install itsycal	     # system level calendar in a nice little icon

brew cask install shiori             # tool to pull in and use bookmarks from pinboard

brew cask install alfred             # tool similar to quicksilver but so much more

brew cask install lacona             # another quick launcher with support for natural language
osascript -e 'tell application "Lacona" to make login item at end with properties {path:"/Application/Lacona.app", hidden:true, name:"Lacona"}'

brew cask install shortcat

# Security Tools - Disabling for now
#brew cask install blockblock
#open /usr/local/Caskroom/blockblock/0.9.6/BlockBlock_Installer.app

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

# Other system enhancements
brew cask install colorpicker-skalacolor

# Command-line driven browser
brew cask install next

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
echo "*** Remember to set up HyperTerm with Fira Code, and packages:"
echo "*** hyperterm-close-on-left,"
echo "*** hyperterm-solarized-dark,"
echo "*** hyperterm-blink, and"
echo "*** hyperborder"
echo "***"

touch ~/.dotfiles/.hasrun_brew_$(stat -f "%Sm" -t "%s" $FILE)

exit 0
