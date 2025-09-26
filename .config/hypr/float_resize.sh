#!/bin/sh
if [[ -n $1 ]]; then
    hyprctl dispatch "$1"
else
    hyprctl dispatch togglefloating
fi
hyprctl dispatch resizeactive exact 800 500
hyprctl dispatch centerwindow
