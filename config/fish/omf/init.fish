set brew_path (brew --prefix)
eval ($brew_path/bin/brew shellenv)

fish_add_path -m $brew_path/bin

set -U EDITOR vim
