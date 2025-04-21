#!/bin/bash

IFS=$'\n'
choices=$(nmcli -t -f SSID,SIGNAL device wifi list | sort -t: -k2 -nr | cut -d: -f1 | awk 'NF' | uniq)
ssid=$(printf "%s\n" "$choices" | tofi --placeholder-text "Connect WiFi")

[ -z "$ssid" ] && exit

nmcli device wifi connect "$ssid" || notify-send "WiFi" "Failed to connect to $ssid"
