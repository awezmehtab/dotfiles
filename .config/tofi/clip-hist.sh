#!/bin/sh

cliphist list | tofi --config=/home/awez/.config/tofi/clip-config | cliphist decode | wl-copy
