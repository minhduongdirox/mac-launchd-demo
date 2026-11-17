---
Sample of Mac launchd service to block/unblock a website in specific hours
---


# Set Permissions and Activate Both Jobs
macOS will ignore any LaunchDaemon file that isn't strictly owned by root:wheel with 644 permissions. Run these commands in Terminal to register them:

# Fix ownership and permissions:
```
sudo chown root:wheel /Library/LaunchDaemons/com.user.unblockweb.plist /Library/LaunchDaemons/com.user.blockweb.plist
sudo chmod 644 /Library/LaunchDaemons/com.user.unblockweb.plist /Library/LaunchDaemons/com.user.blockweb.plist
```

# Load them into launchd:
```
sudo launchctl bootstrap system /Library/LaunchDaemons/com.user.unblockweb.plist
sudo launchctl bootstrap system /Library/LaunchDaemons/com.user.blockweb.plist
```

# Test immediately without waiting until 17:00 or 18:00:
```
sudo launchctl kickstart -k system/com.user.blockweb
```

Verification: Run cat /etc/hosts and confirm the 127.0.0.1 entry for your web website was appended. (You can then test sudo launchctl kickstart -k system/com.user.unblockweb and verify the line gets removed.)