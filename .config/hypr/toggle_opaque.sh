#!/bin/sh
addr=$(hyprctl activewindow -j | jq -r '.address // empty')
if [ -z "$addr" ]; then
  notify-send "hypr" "no active window"
  exit 1
fi
hyprctl dispatch setprop address:"$addr" opaque toggle
