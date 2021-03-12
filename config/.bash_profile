# Set up Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Fill in partials (use .locals for any stuff you don't want to commit)
for file in ~/.{aliases,locals}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

