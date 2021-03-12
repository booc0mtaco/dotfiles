# Set up Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load in partial config files
for file in ~/.{aliases,}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
