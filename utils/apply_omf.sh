#!/usr/bin/env bash

###
# Apply oh-my-fish files to the proper directory
###

CHECKOUT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )"

export SOURCE_DIR="config/fish/omf"
export DESTINATION_DIR="$( cd ~/.config/omf && pwd)"

$CHECKOUT_DIR/utils/apply_config.sh $1
