# Set up Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# setup thefuck
# TODO: set up check for command first OR add after install
eval $(thefuck --alias)

# Load in partial config files (use .locals for any stuff you don't want to commit)
for file in ~/.{aliases,exports,locals}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

