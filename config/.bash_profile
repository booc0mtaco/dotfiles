# Set up Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# setup thefuck
eval $(thefuck --alias)

# Fill in partials (use .locals for any stuff you don't want to commit)
for file in ~/.{aliases,locals}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#
# Bash options
#

# Case-insensivive globbing when expanding paths
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

