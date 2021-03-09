#!/usr/bin/env bash

# Set up oh-my-fish . This depends on fish being installed. 

FILE=`basename "$0"`
mkdir -p ~/.dotfiles

if [ -e ~/.dotfiles/.hasrun_omf_$(stat -f "%Sm" -t "%s" $FILE) ]
then
    echo "oh-my-fish has already been set up."
    exit -2
fi

if [ -e ~/.dotfiles/.hasrun_brew_$(stat -f "%Sm" -t "%s" 2-brew.sh) ]
then
    echo "Installing oh-my-fish shell extension framework . . ."
else
    echo "Level 2 commands have not been run yet!"
    exit -1
fi 

curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

# omf help
# omf update

# Install omf packages and themes
# set up robbyrussell as well

# omf install robbyrussell
# omf install beloglazov
# omf install plugin-nvm
# omf install bass

echo "***"
echo "*** oh-my-fish successfully installed."
echo "*** Review 3-oh-my-fish.sh to run post-install commands!"
echo "***"

touch ~/.dotfiles/.hasrun_omf_$(stat -f "%Sm" -t "%s" $FILE)
