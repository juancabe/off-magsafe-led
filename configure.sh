#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <HOME_DIRECTORY>"
    exit 1
fi

USER_HOME="$1"

# Ensure necessary directories exist
mkdir -p ~/Library/LaunchAgents
mkdir -p ~/bin

# Copy smc to /usr/local/bin
sudo cp ./smc /usr/local/bin/smc

# Use sed to replace /Users/user with the provided home directory.
# Create temporary files with substituted paths.
sed "s|/Users/user|${USER_HOME}|g" com.user.magsafe_daemon.plist > /tmp/com.user.magsafe_daemon.plist.tmp
sed "s|/Users/user|${USER_HOME}|g" magsafe_daemon.sh > /tmp/magsafe_daemon.sh.tmp

# Copy the modified files to their destination directories
cp /tmp/com.user.magsafe_daemon.plist.tmp ~/Library/LaunchAgents/com.user.magsafe_daemon.plist
cp /tmp/magsafe_daemon.sh.tmp ~/bin/magsafe_daemon.sh

# Clean up temporary files
rm /tmp/com.user.magsafe_daemon.plist.tmp /tmp/magsafe_daemon.sh.tmp

# Make the daemon script executable
sudo chmod a+x ~/bin/magsafe_daemon.sh

# Change ownership of the plist and the shell script to root:wheel
sudo chown -R root:wheel ~/Library/LaunchAgents/com.user.magsafe_daemon.plist
sudo chown -R root:wheel ~/bin/magsafe_daemon.sh

echo "Configuration complete. If not already loaded, load the daemon with:"
echo "launchctl load ~/Library/LaunchAgents/com.user.magsafe_daemon.plist"
echo "Unload the daemon with:"
echo "launchctl unload ~/Library/LaunchAgents/com.user.magsafe_daemon.plist"