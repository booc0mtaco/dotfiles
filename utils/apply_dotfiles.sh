#!/usr/bin/env bash

###
# This takes a param for the home directory config file
# and makes a symlink from the checkout directory to
# the home directory with the same name.
###

CHECKOUT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )"

export SOURCE_DIR="config"
export DESTINATION_DIR="$( cd && pwd )"

$CHECKOUT_DIR/utils/apply_config.sh $1

