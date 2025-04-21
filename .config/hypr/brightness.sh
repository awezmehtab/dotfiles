#!/bin/bash

BRIGHTNESS=$(brightnessctl get)
MAX=$(brightnessctl max)
PERCENT=$(( 100 * BRIGHTNESS / MAX ))

notify-send -r 9994 -u low -a "brightness" \
    -h string:desktop-entry:brightness \
    -h int:value:"$PERCENT" "Brightness: ${PERCENT}%"
