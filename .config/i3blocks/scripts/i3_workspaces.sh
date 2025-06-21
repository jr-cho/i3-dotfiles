#!/bin/bash

# Catppuccin Mocha colors
BASE="#1e1e2e"
TEXT="#cdd6f4"
SURFACE0="#313244"
SAPPHIRE="#89b4fa"
RED="#f38ba8"

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "<span foreground='$RED'>JQ Error!</span>"
    exit 1
fi

i3-msg -t get_workspaces | jq -r '.[] | .name as $name | .focused as $focused | .urgent as $urgent | .visible as $visible |
    if $focused then
        "<span background=\"'$SAPPHIRE'\" foreground=\"'$BASE'\"> \($name) </span>"
    elif $urgent then
        "<span background=\"'$RED'\" foreground=\"'$BASE'\"> \($name) </span>"
    elif $visible then
        "<span background=\"'$SURFACE0'\" foreground=\"'$SAPPHIRE'\"> \($name) </span>"
    else
        "<span background=\"'$BASE'\" foreground=\"'$OVERLAY0'\"> \($name) </span>"
    end' | tr -d '\n'
echo "" # Newline at the end
