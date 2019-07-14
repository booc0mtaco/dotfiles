#!/usr/bin/env bash

###
# Copies config files for config content
###

CHECKOUT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )"
echo "*** Running from checkout directory: $CHECKOUT_DIR ***"

SOURCE_DIR="config/fish"
DESTINATION_DIR="$( cd ~/.config/fish/functions && pwd)"

$CHECKOUT_DIR/utils/apply_config $1
