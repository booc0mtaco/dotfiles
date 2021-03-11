# Set up Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

$ Fill in partials
for file in ~/.{aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

