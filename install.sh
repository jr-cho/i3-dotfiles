#!/usr/bin/env bash
# This script automates the installation and setup of dotfiles.
# It performs the following actions:
# 1. Displays an ASCII art header.
# 2. Updates the system and installs required packages (with optional developer tools).
# 3. Creates necessary configuration directories.
# 4. Creates symlinks for dotfiles.
# 5. Configures the default shell and enables essential services.
# 6. Provides a final message for reboot or re-login.

set -euo pipefail

# --- Color Variables ---
GREEN="\033[0;32m"
CYAN="\033[0;36m"
RESET="\033[0m"

# --- ASCII Art Header ---
echo -e "

     ██╗██████╗        ██████╗██╗  ██╗ ██████╗ 
     ██║██╔══██╗      ██╔════╝██║  ██║██╔═══██╗
     ██║██████╔╝█████╗██║     ███████║██║   ██║
██   ██║██╔══██╗╚════╝██║     ██╔══██║██║   ██║
╚█████╔╝██║  ██║      ╚██████╗██║  ██║╚██████╔╝
 ╚════╝ ╚═╝  ╚═╝       ╚═════╝╚═╝  ╚═╝ ╚═════╝ 

"

# --- Configuration Variables ---
# Assumes the script is run from the root of your dotfiles directory.
DOTFILES_DIR="$(pwd)"

# List of configuration files to be symlinked directly in the home directory.
# These are handled separately from the CONFIGS array below.
HOME_CONFIG_FILES=(
  ".zshrc"
  ".tmux.conf"
)

# List of configuration directories to be symlinked under ~/.config/.
CONFIGS=(
  dmenu
  dunst
  i3
  i3blocks
  kitty
  neofetch
  nvim
  ohmyposh
  picom
  wallpaper
  zathura
)

# Base packages to install.
PACKAGES=(
  bat
  bluetooth # Added as per your script
  btop
  curl
  dmenu
  dunst
  feh
  flameshot
  git
  i3-wm
  i3blocks
  kitty
  ly
  neofetch
  neovim
  oh-my-posh
  picom
  ripgrep
  starship
  tmux
  ttf-firacode-nerd
  ttf-jetbrains-mono
  ttf-nerd-fonts-symbols
  unzip
  wget
  xz
  zathura
  zathura-pdf-mupdf
  zsh
)

# Developer tools packages (optional).
DEV_PACKAGES=(
  python
  python-pip
  rustup
  go
  nodejs
  npm
)

# --- Script Execution Start ---

echo "--- Starting Dotfiles Installation Script ---"

# 1. Update system and install packages
echo -e "${CYAN}==> Updating system...${RESET}"
if ! command -v yay &> /dev/null; then
    echo "==> 'yay' (AUR helper) not found. Please install 'yay' manually before running this script."
    echo "    For example, on Arch Linux: sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
    exit 1
fi
yay -Syu --noconfirm

echo -e "${CYAN}==> Do you want to install developer tools (Python, Rust, Go, Node.js)? [y/N]${RESET}"
read -r dev_choice

INSTALL_DEV=false
if [[ "$dev_choice" =~ ^[Yy]$ ]]; then
  INSTALL_DEV=true
fi

echo -e "${CYAN}==> Installing packages...${RESET}"
if $INSTALL_DEV; then
  echo -e "${CYAN}==> Adding dev tools to package list...${RESET}"
  PACKAGES+=("${DEV_PACKAGES[@]}")
fi

yay -S --noconfirm "${PACKAGES[@]}"

if $INSTALL_DEV; then
  echo -e "${CYAN}==> Setting up Rust via rustup...${RESET}"
  rustup default stable || { echo "Warning: Could not set rustup default stable. You might need to run 'rustup init' first."; }
fi

# 2. Create config directories
echo -e "${CYAN}==> Creating config directories...${RESET}"
mkdir -p ~/.config

# 3. Symlink Dotfiles
echo -e "${CYAN}==> Linking dotfiles...${RESET}"

# Symlink files directly in HOME
for file in "${HOME_CONFIG_FILES[@]}"; do
  echo -e "${GREEN}✔ Linking $file...${RESET}"
  ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
done

# Symlink directories under ~/.config/
for cfg in "${CONFIGS[@]}"; do
  echo -e "${GREEN}✔ Linking $cfg...${RESET}"
  ln -sf "$DOTFILES_DIR/.config/$cfg" "$HOME/.config/$cfg"
done

# 4. Final System Setup
echo -e "${CYAN}==> Configuring ZSH and Starship...${RESET}"
if [[ "$(basename "$SHELL")" != "zsh" ]]; then
  chsh -s "$(which zsh)" || { echo "Warning: Could not change default shell to zsh. Please do it manually if desired."; }
fi

# Add starship init to .zshrc if not present
if ! grep -q 'starship init' ~/.zshrc; then
  echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi

echo -e "${CYAN}==> Enabling essential services...${RESET}"
sudo systemctl enable --now NetworkManager.service || true
sudo systemctl enable --now bluetooth.service || true

echo -e "${CYAN}==> Setting up Ly Display Manager...${RESET}"
sudo systemctl enable ly.service || true

echo -e "${CYAN}==> Disabling other display managers...${RESET}"
sudo systemctl disable gdm.service 2>/dev/null || true
sudo systemctl disable sddm.service 2>/dev/null || true
sudo systemctl disable lightdm.service 2>/dev/null || true

# --- Final Message ---
echo -e "${GREEN}Done! Reboot or log in again to apply i3 and shell changes.${RESET}"
