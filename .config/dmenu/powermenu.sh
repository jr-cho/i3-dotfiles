#!/usr/bin/env bash

# Catppuccin Mocha Dmenu colors
DMENU_FN='JetBrainsMono Nerd Font:size=10'
DMENU_NB='#1e1e2e' # Normal Background (base)
DMENU_NF='#cdd6f4' # Normal Foreground (text)
DMENU_SB='#89b4fa' # Selected Background (sapphire)
DMENU_SF='#1e1e2e' # Selected Foreground (base, for contrast)

chosen=$(echo -e "Shutdown\nReboot\nSuspend\nLogout" | dmenu \
    -fn "$DMENU_FN" \
    -nb "$DMENU_NB" \
    -nf "$DMENU_NF" \
    -sb "$DMENU_SB" \
    -sf "$DMENU_SF" \
    -p 'Power: ' \
    -i \
    -l 4) # Display 4 lines for these options

case "$chosen" in
    "Shutdown") systemctl poweroff ;;
    "Reboot") systemctl reboot ;;
    "Suspend") systemctl suspend ;;
    "Logout") i3-msg exit ;; # Exits i3
esac
