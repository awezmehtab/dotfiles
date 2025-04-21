#!/bin/bash

# Get raw volume (e.g., 0.00 to 1.00, and we multiply to get 0-400%)
VOLUME_FLOAT=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
VOLUME_PERCENT=$(awk "BEGIN {printf \"%d\", $VOLUME_FLOAT * 100}")

IS_MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep MUTED)

if [ -n "$IS_MUTED" ]; then
    TEXT="Muted"
    BAR_VALUE=0
else
    TEXT="Volume: ${VOLUME_PERCENT}%"
    # Scale volume back to 0–100 for dunst
    BAR_VALUE=$(awk "BEGIN {printf \"%d\", ($VOLUME_PERCENT / 400) * 100}")
fi

notify-send -r 9993 -u low -a "volume" \
    -h string:desktop-entry:volume \
    -h int:value:"$BAR_VALUE" "$TEXT"
