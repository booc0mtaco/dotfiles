#!/usr/bin/env bash

# Taken from (https://github.com/mathiasbynens/dotfiles/blob/master/.osx)
# set up some default values to make the computer behave in a nice way.

FILE=`basename "$0"`
mkdir -p ~/.dotfiles

if [ -e ~/.dotfiles/.hasrun_defaults_$(stat -f "%Sm" -t "%s" $FILE) ]
then
    echo "Defaults setup has already run."
    exit -2
else
    echo "Begin defaults setup . . ."
fi

if [ -e ~/.dotfiles/.hasrun_init_$(stat -f "%Sm" -t "%s" 1-init.sh) ]
then
    echo "Setting application defaults (macOS). . ."
else
    echo "***"
    echo "***Please run 1-init.sh first!"
    echo "***"
    exit -1
fi

# close any open System Preferences Panes, to prevent them from overriding
# settings we're about to change
osascript -e 'tell application "System Preferences" to quit'

# ask for the administrator password to start
sudo -v

# Keep-alive: update existing `sudo` time stamp until this file has finished processing (bg)
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Finder: Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Finder: Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Finder: Automatically open a new window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Dock: Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Set Safari's default home page to untropy.net
defaults write com.apple.Safari HomePage -string "http://untropy.net/start"

# Have Safari always preserve the session after shutdown
defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# Mail.app                                                                    #
###############################################################################

# Enable Bundles in the application (v4)
sudo defaults write “/Library/Preferences/com.apple.mail” EnableBundles 1
defaults write com.apple.mail EnableBundles -bool true
defaults write com.apple.mail BundleCompatibilityVersion 4

###############################################################################
# Kill affected applications                                                  #
###############################################################################

echo "***"
echo "*** Done. Note that some of these changes require a logout/restart to take effect."
echo "***"

touch ~/.dotfiles/.hasrun_defaults_$(stat -f "%Sm" -t "%s" $FILE)

sleep 3

for app in "Activity Monitor" "cfprefsd" \
	    "Dock" "Finder" "Google Chrome" \
	    "Terminal" "Safari" "SystemUIServer" \
            "Mail"; do
	    killall "${app}" &> /dev/null
done

exit 0
