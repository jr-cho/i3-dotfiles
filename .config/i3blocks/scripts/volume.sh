#!/bin/bash

# Catppuccin Mocha colors
SAPPHIRE="#89b4fa"
SURFACE0="#313244"

# Get volume and mute status
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=[%])' | head -1)
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

ICON_MUTE="󰝟" # Muted icon
ICON_LOW="󰕿"  # Low volume
ICON_MED="󰖀"  # Medium volume
ICON_HIGH="󰕾" # High volume

if [ "$MUTE" == "yes" ]; then
    echo "<span foreground='$SAPPHIRE' background='$SURFACE0'> ${ICON_MUTE} Muted </span>"
else
    if (( VOLUME < 33 )); then
        ICON="$ICON_LOW"
    elif (( VOLUME < 66 )); then
        ICON="$ICON_MED"
    else
        ICON="$ICON_HIGH"
    fi
    echo "<span foreground='$SAPPHIRE' background='$SURFACE0'> ${ICON} ${VOLUME}% </span>"
fi
