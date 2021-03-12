#!/usr/bin/env bash

###
# base script for copying files to the proper directory
# use env variables to control source and destination
###

CHECKOUT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )"

# Check to see if we specified a param first
if [ $# -eq 0 ]; then
	echo "*** Error: You must specify an existing dotfile to use this script ***"
	exit 1
fi

# If we did, check to see that the file exists
if [ ! -f $CHECKOUT_DIR/$SOURCE_DIR/$1 ]; then
	echo "*** Error: could not find $1 in the config checkout: $CHECKOUT_DIR/$SOURCE_DIR/$1 ***"
	exit 2
fi

# If it does, check to see if a file exists in the home directory
# echo "*** Symlinking $1 from $CHECKOUT_DIR/$SOURCE_DIR . . . ***"

# if a file exists in the home directory with that name, copy it
# to a *.bak file.
echo "$DESTINATION_DIR/$1"

if [ -f $DESTINATION_DIR/$1 ]; then
	if [ ! -L $DESTINATION_DIR/$1 ]; then
		echo "*** Backing up existing file to $1.bak . . . ***"
		mv $DESTINATION_DIR/$1 $DESTINATION_DIR/$1.bak
	fi
fi

# if a symlink already exists, say so, but not an error. Overwrite
if [ -L $DESTINATION_DIR/$1 ]; then
	rm $DESTINATION_DIR/$1;
fi

ln -s $CHECKOUT_DIR/$SOURCE_DIR/$1 $DESTINATION_DIR/$1

