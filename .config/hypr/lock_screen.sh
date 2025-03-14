#!/bin/bash
if ! pgrep -x "hyprlock" > /dev/null
then
    hyprlock
fi
