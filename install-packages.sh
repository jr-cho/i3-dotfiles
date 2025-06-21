#!/usr/bin/env bash

# Exit on error and undefined variable
set -euo pipefail

# Colors
GREEN="\033[0;32m"
CYAN="\033[0;36m"
RESET="\033[0m"

echo "


     ██╗██████╗        ██████╗██╗  ██╗ ██████╗ 
     ██║██╔══██╗      ██╔════╝██║  ██║██╔═══██╗
     ██║██████╔╝█████╗██║     ███████║██║   ██║
██   ██║██╔══██╗╚════╝██║     ██╔══██║██║   ██║
╚█████╔╝██║  ██║      ╚██████╗██║  ██║╚██████╔╝
 ╚════╝ ╚═╝  ╚═╝       ╚═════╝╚═╝  ╚═╝ ╚═════╝ 
                                               

"

# Root directory of dotfiles
DOTFILES_DIR="$(pwd)"

echo -e "${CYAN}==> Updating system...${RESET}"
yay -Syu --noconfirm

echo -e "${CYAN}==> Installing required packages with yay...${RESET}"
PACKAGES=(
  i3-wm
  i3blocks
  dunst
  picom
  kitty
  neovim
  zathura
  zathura-pdf-mupdf
  feh
  oh-my-posh
  neofetch
  lxappearance
  rofi
  ttf-jetbrains-mono
  ttf-nerd-fonts-symbols
  ttf-firacode-nerd
  flameshot
  xwallpaper
  unzip
  wget
  curl
  git
  zsh
  starship
  bat
  tmux
  btop
  ripgrep
  ly 
)

yay -S --noconfirm "${PACKAGES[@]}"

echo -e "${CYAN}==> Creating config directories if not exist...${RESET}"
mkdir -p ~/.config

echo -e "${CYAN}==> Linking dotfiles...${RESET}"

ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf

CONFIGS=(
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

for cfg in "${CONFIGS[@]}"; do
  echo -e "${GREEN}✔ Linking $cfg...${RESET}"
  ln -sf "$DOTFILES_DIR/.config/$cfg" ~/.config/$cfg
done

echo -e "${CYAN}==> Setting wallpaper (optional)...${RESET}"
xwallpaper --zoom ~/.config/wallpaper/panes.png || echo "xwallpaper not installed or failed to set wallpaper"

echo -e "${CYAN}==> Configuring ZSH and Starship...${RESET}"

if [[ "$SHELL" != *zsh ]]; then
  chsh -s "$(which zsh)"
fi

if ! grep -q 'starship init' ~/.zshrc; then
  echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi

echo -e "${CYAN}==> Enabling essential services...${RESET}"
sudo systemctl enable --now NetworkManager.service || true
sudo systemctl enable --now bluetooth.service || true

echo -e "${CYAN}==> Setting up Ly Display Manager...${RESET}"
sudo systemctl enable ly.service

echo -e "${CYAN}==> Disabling other display managers (if present)...${RESET}"
sudo systemctl disable gdm.service || true
sudo systemctl disable sddm.service || true
sudo systemctl disable lightdm.service || true

echo -e "${GREEN}Done! Please reboot or re-login to apply shell and i3 session changes.${RESET}"
