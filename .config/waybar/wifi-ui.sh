#!/bin/bash

# Get ESSID and signal strength
ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
signal=$(nmcli -f IN-USE,SIGNAL dev wifi | awk '/^\*/ {print $2}')

essid="$ssid"

# Map icons (like format-icons)
if [ -z "$essid" ]; then
    icon="󰤯"  # Disconnected
elif [ "$signal" -ge 75 ]; then
    icon="󰤨"
elif [ "$signal" -ge 50 ]; then
    icon="󰤥"
elif [ "$signal" -ge 25 ]; then
    icon="󰤢"
else
    icon="󰤟"
fi

# Aliases
case "$essid" in
    "") alias="no wifi";;
    *) alias="$essid";;
esac

# Truncate to 7 chars like max-length
alias_short=$(echo "$alias" | cut -c1-7)

# Output for Waybar
echo "{\"text\": \"$icon $alias_short\", \"tooltip\": \"$essid ($signal%)\"}"
