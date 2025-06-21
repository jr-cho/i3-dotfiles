#!/bin/bash

# Catppuccin Mocha colors
SAPPHIRE="#89b4fa"
SURFACE0="#313244"

# Get current time and date
TIME=$(date +"%I:%M %p")
DATE=$(date +"%a, %d %b %Y")

# Output with Pango markup
echo "<span foreground='$SAPPHIRE' background='$SURFACE0'> 󱑂 ${TIME} </span>"
# Add this line if you want to see date on hover/click:
# echo "<span foreground='$SAPPHIRE' background='$SURFACE0'> ${DATE} </span>" # full text on second line
# echo "" # third line for full output for i3blocks if needed
