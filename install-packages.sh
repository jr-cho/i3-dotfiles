#!/usr/bin/env bash

set -euo pipefail

GREEN="\033[0;32m"
CYAN="\033[0;36m"
RESET="\033[0m"

echo -e "

     ██╗██████╗        ██████╗██╗  ██╗ ██████╗ 
     ██║██╔══██╗      ██╔════╝██║  ██║██╔═══██╗
     ██║██████╔╝█████╗██║     ███████║██║   ██║
██   ██║██╔══██╗╚════╝██║     ██╔══██║██║   ██║
╚█████╔╝██║  ██║      ╚██████╗██║  ██║╚██████╔╝
 ╚════╝ ╚═╝  ╚═╝       ╚═════╝╚═╝  ╚═╝ ╚═════╝ 

"

DOTFILES_DIR="$(pwd)"

echo -e "${CYAN}==> Updating system...${RESET}"
yay -Syu --noconfirm

echo -e "${CYAN}==> Do you want to install developer tools (Python, Rust, Go, npm)? [y/N]${RESET}"
read -r dev_choice

INSTALL_DEV=false
if [[ "$dev_choice" =~ ^[Yy]$ ]]; then
  INSTALL_DEV=true
fi

echo -e "${CYAN}==> Installing packages...${RESET}"
PACKAGES=(
  bat
  bluetooth
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

if $INSTALL_DEV; then
  echo -e "${CYAN}==> Adding dev tools to package list...${RESET}"
  PACKAGES+=(
    python
    python-pip
    rustup
    go
    nodejs
    npm
  )
fi

yay -S --noconfirm "${PACKAGES[@]}"

if $INSTALL_DEV; then
  echo -e "${CYAN}==> Setting up Rust via rustup...${RESET}"
  rustup default stable
fi

echo -e "${CYAN}==> Creating config directories...${RESET}"
mkdir -p ~/.config

echo -e "${CYAN}==> Linking dotfiles...${RESET}"
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf

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

for cfg in "${CONFIGS[@]}"; do
  echo -e "${GREEN}✔ Linking $cfg...${RESET}"
  ln -sf "$DOTFILES_DIR/.config/$cfg" ~/.config/$cfg
done

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

echo -e "${CYAN}==> Disabling other display managers...${RESET}"
sudo systemctl disable gdm.service || true
sudo systemctl disable sddm.service || true
sudo systemctl disable lightdm.service || true

echo -e "${GREEN}✅ Done! Reboot or log in again to apply i3 and shell changes.${RESET}"
