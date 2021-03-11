#!/usr/bin/env bash

# This file is responsible for setting up the tools and resources via home brew (http://brew.sh)
# It assumes the init script has already been run, which installs system-wide dependencies and
# such. Checks for .hasrun_init in home directory.

CHECKOUT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
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
    echo "***Please run 1-init.sh first!"
    echo "***"
    exit -1
fi

#
# CLI Section
#

# command line / system / shell tools
brew install the_silver_searcher    # fork of ack that is more performant (command: `ag`)
brew install bat		    # better than less (cat with colors!)
brew install exa                    # replacement for ls (e.g., alias="exa --long --git")
brew install tmux		    # replacement for screen. sessions for shells
brew install tree		    # see the contents of a directory structure
brew install cloc                   # Tool that does source code counts and analytics (`cpan Moo::Role` as needed)
brew install wget		    # retrieve files from the internet
brew install rename		    # allow for batch renaming operations (util-linux)
brew install fish		    # alternative CLI shell for the 90s!

# install and setup fzf
brew install fzf                    # Fuzzy Finder (for bash, zsh, fish)
/usr/local/opt/fzf/install          # Set up right away

# Development tools
brew install httpie                 # Manage HTTP commands easier than with cURL
brew install jq                     # Manipulate JSON data like a baus
brew install vim		    # Install the latest version of VIM
brew install git                    # Git Client, latest version (non-system)

# Programming Environments
brew install python3                # Python language interpreter, v3.x (non-system)
brew install node                   # NodeJS

# Source Control Tools
# brew install git-flow-avh	    # methodology for managing branches and development
brew install git-delta              # alternative diff viewer, v2. https://github.com/dandavison/delta
brew install tig		    # command line tool for viewing commit history

# Generic Command Line Tools
brew install thefuck                # Fix your last command because you cannot type !

# The fuck requires some configuration. Set up is here
echo "eval (thefuck --alias | tr '\n' ';')" | cat >> ~/.config/fish/config.fish
# install bashtop (python version) : https://github.com/aristocratos/bpytop
python3 -m pip install psutil
brew install osx-cpu-temp
git clone https://github.com/aristocratos/bpytop.git $CHECKOUT_DIR/bpytop
cd bpytop
sudo make install
cd -

#
# GUI / Desktop App Section
#

# Editors
brew cask install typora             # Edit markdown files without split views
brew cask install iterm2             # Terminal emulator with advanced features

# Desktop Tools
brew cask install xquartz	     # open Source compositing engine
brew cask install the-unarchiver     # UnZIP things from many different formats
brew cask install maccy              # Clipboard manager (in lieu of Alfred's built-in stuff)
brew cask install iina		     # Alternative video player 
brew cask install alt-tab            # Show window previews when tabbing between windows
brew cask install itsycal	     # system level calendar in a nice little icon
brew cask install alfred             # tool similar to quicksilver but so much more
brew cask install rocket             # tool to make using emoji much easier (slack-like)

# Finder enhancements (QuickLook)
brew cask install qlmarkdown	     # QuickLook : markdown files
brew cask install qlstephen	     # Quicklook : text files of different sorts
brew cask install suspicious-package # Quicklook : view inside zip files before opening them
brew cask install qlcolorcode        # Quicklook : color code ... code
brew cask install quicklook-json     # Quicklook : provide structure to JSON files
brew cask install qlprettypatch      # Quicklook : show patch files with diff information
brew cask install quicklook-csv      # Quicklook : show CSV information in context
brew cask install qlimagesize        # Quicklook : show image metrics and info in context

# For Catalina+, "trust" these QuickLook Extensions
echo "Setting up QuickLook Extensions. . ."
xattr -cr ~/Library/QuickLook/*.qlgenerator
qlmanage -r
qlmanage -r cache

#
# Other system enhancements
#
brew cask install bitbar

#
# Fonts
#

# set up font cask
brew tap homebrew/cask-fonts

# install monospace fonts for programming
brew cask install font-fira-code
brew cask install font-fira-mono
brew cask install font-jetbrains-mono

echo "Restarting Finder. . ."
killall "Finder" &> /dev/null

echo "***"
echo "*** Installed brew packages successfully"
echo "*** Symlinked commands: stree"
echo "***"

touch ~/.dotfiles/.hasrun_brew_$(stat -f "%Sm" -t "%s" $FILE)

exit 0
