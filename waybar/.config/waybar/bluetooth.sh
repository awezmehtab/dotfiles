#!/bin/bash

DEVICE_INFO=$(bluetoothctl info)
DEVICE_NAME=$(echo "$DEVICE_INFO" | grep "Name" | cut -d ' ' -f2-)
CONNECTED=$(echo "$DEVICE_INFO" | grep "Connected: yes")

if [[ -n "$CONNECTED" ]]; then
    echo "{\"text\": \"󰂯 $DEVICE_NAME\", \"tooltip\": \"$DEVICE_NAME\"}"
else
    echo "{\"text\": \"󰂲\", \"tooltip\": \"No device connected\"}"
fi

