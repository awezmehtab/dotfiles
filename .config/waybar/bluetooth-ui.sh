#!/bin/bash

# Only one tofi at a time
pgrep -x tofi >/dev/null && {
  notify-send "Bluetooth UI" "Tofi is already open"
  exit 1
}

# Scan for devices (ignore error on stop)
bluetoothctl scan on >/dev/null 2>&1 &
sleep 2
bluetoothctl scan off >/dev/null 2>&1 || notify-send "Bluetooth" "Couldn't stop scan (already off?)"

# Get devices
mapfile -t lines < <(
  bluetoothctl devices | while read -r _ mac name; do
    if [ -z "$name" ]; then
      name=$(bluetoothctl info "$mac" | grep "Name" | cut -d ' ' -f2-)
    fi
    echo "$mac $name"
  done
)
[ ${#lines[@]} -eq 0 ] && notify-send "Bluetooth" "No devices found" && exit 1

# Show menu
choice=$(printf "%s\n" "${lines[@]}" | cut -d ' ' -f2- | tofi --prompt "Bluetooth:")
[ -z "$choice" ] && exit

# Connect
mac=$(bluetoothctl devices | grep "$choice" | awk '{print $2}')
bluetoothctl connect "$mac" || notify-send "Bluetooth" "Failed to connect to $choice"
