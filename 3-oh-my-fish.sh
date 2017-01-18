#!/bin/bash

# Set up oh-my-fish . This depends on fish being installed. 

if [ -e ~/.hasrun_omf ]
then
    echo "oh-my-fish has already been set up. To re-run, remove ~/.hasrun_omf ."
    exit -2
fi

if [ -e ~/.hasrun_brew ]
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

echo "***"
echo "*** oh-my-fish successfully installed."
echo "*** Review 3-oh-my-fish.sh to run post-install commands!"
echo "***"

touch ~/.hasrun_omf
