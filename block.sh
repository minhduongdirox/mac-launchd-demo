#!/bin/bash
# Add block if not already present
if ! grep -q "example.com" /etc/hosts; then
  echo "127.0.0.1 example.com www.example.com" >> /etc/hosts
fi
# Flush macOS DNS cache
dscacheutil -flushcache
killall -HUP mDNSResponder