# Set up Brew
brew_path=$(brew --prefix)
eval "$($brew_path/bin/brew shellenv)"

# setup thefuck
eval $(thefuck --alias)

# Load in partial config files (use .locals for any stuff you don't want to commit)
for file in ~/.{aliases,exports,locals}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
