#!/bin/bash
# Remove lines containing the domain
sed -i '' '/example\.com/d' /etc/hosts
dscacheutil -flushcache
killall -HUP mDNSResponder