#!/bin/bash

# Catppuccin Mocha colors
SAPPHIRE="#89b4fa"
SURFACE0="#313244"

# Get the window title
TITLE=$(xprop -id "$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $NF}')" WM_NAME WM_ICON_NAME | \
    grep -E 'WM_NAME|WM_ICON_NAME' | head -1 | cut -d '=' -f 2- | sed 's/"//g')

# Trim long titles and add ellipses
if [[ ${#TITLE} -gt 60 ]]; then
    TITLE="${TITLE:0:57}..."
fi

# Output with Pango markup
echo "<span foreground='$SAPPHIRE' background='$SURFACE0'> ${TITLE:-Desktop} </span>"
