# i3 Dotfiles

A minimalistic collection of configuration files for a productive and aesthetically pleasing development environment on Arch-based distributions. This setup features i3wm, ZSH, Neovim, Tmux, and modern terminal tools with a cohesive Catppuccin Mocha color scheme.

## Overview

This dotfiles repository provides a complete desktop environment configuration focused on productivity and visual consistency. The setup is optimized for developers and power users who prefer keyboard-driven workflows.

## Features

### Core Components
- **i3 Window Manager** - Tiling window manager with custom keybindings and i3blocks status bar
- **Kitty Terminal** - GPU-accelerated terminal with JetBrains Mono Nerd Font
- **Neovim** - Modern text editor with LSP support, syntax highlighting, and productivity plugins
- **ZSH Shell** - Enhanced shell with Oh My Posh prompt and useful aliases
- **Tmux** - Terminal multiplexer for advanced session management

### Visual & System Tools
- **Dunst** - Notification daemon with clean, minimal styling
- **Picom** - Compositor providing transparency, shadows, and smooth animations
- **Dmenu** - Application launcher with optional Catppuccin theming
- **Flameshot** - Screenshot utility with GUI interface
- **Neofetch** - System information display with personalized configuration
- **Zathura** - PDF viewer with vim-like keybindings
- **Feh** - Wallpaper management with automatic loading

### Design Philosophy
- **Catppuccin Mocha** color scheme consistently applied across all applications
- **Minimalist approach** focusing on functionality over visual clutter
- **Keyboard-centric** workflow optimization

## Prerequisites

- **Operating System**: Arch Linux or Arch-based distribution
- **AUR Helper**: [yay](https://github.com/Jguer/yay) installed and configured
- **Version Control**: Git
- **Build Tools**: base-devel package group

## Installation

### Automated Installation (Recommended)

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run the installation script**:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. **Apply changes**:
   ```bash
   # Reboot or restart your display manager
   sudo reboot
   ```

### Manual Installation

For users who prefer granular control or want to understand the installation process:

1. **Install required packages**:
   ```bash
   yay -S --noconfirm \
     bat bluetooth btop curl dmenu dunst feh flameshot git \
     i3-wm i3blocks kitty ly neofetch neovim oh-my-posh \
     picom ripgrep starship tmux ttf-firacode-nerd \
     ttf-jetbrains-mono ttf-nerd-fonts-symbols unzip wget xz \
     zathura zathura-pdf-mupdf zsh thunar firefox
   ```

2. **Deploy configuration files**:
   ```bash
   cp -r .config/* ~/.config/
   cp .zshrc ~/.zshrc
   cp .tmux.conf ~/.tmux.conf
   ```

3. **Configure shell**:
   ```bash
   chsh -s $(which zsh)
   ```

4. **Enable display manager** (optional):
   ```bash
   sudo systemctl enable ly.service
   ```

## Project Structure

```
dotfiles/
├── .config/
│   ├── dmenu/          # Application launcher configuration
│   ├── dunst/          # Notification daemon settings
│   ├── i3/             # i3 window manager configuration
│   ├── i3blocks/       # Status bar configuration and scripts
│   ├── kitty/          # Terminal emulator settings
│   ├── neofetch/       # System information display config
│   ├── nvim/           # Neovim editor configuration
│   ├── ohmyposh/       # Shell prompt configuration
│   ├── picom/          # Compositor settings
│   ├── wallpaper/      # Desktop background collection
│   └── zathura/        # PDF viewer configuration
├── .tmux.conf          # Terminal multiplexer configuration
├── .zshrc              # ZSH shell configuration
├── install.sh          # Automated installation script
└── README.md           # Project documentation
```

## Development Environment (Optional)

The installation script offers optional development tools:

### Programming Languages
- **Python** with pip package manager
- **Rust** with rustup toolchain manager
- **Go** programming language
- **Node.js** with npm package manager

### Additional Tools
- Enhanced Git configuration
- SQLite database tools
- PostgreSQL client tools (manual installation)

## Key Bindings

### Window Management
| Binding | Action |
|---------|--------|
| `Mod + Enter` | Open terminal (Kitty) |
| `Mod + d` | Application launcher (dmenu) |
| `Mod + f` | Launch Firefox browser |
| `Mod + c` | Open file manager (Thunar) |
| `Mod + q` | Close focused window |
| `Mod + Shift + s` | Take screenshot (Flameshot) |

### Navigation
| Binding | Action |
|---------|--------|
| `Mod + Arrow Keys` | Navigate between windows |
| `Mod + Shift + Arrow Keys` | Move windows |
| `Mod + w` | Tabbed layout |
| `Mod + e` | Toggle split layout |
| `Mod + Shift + Space` | Toggle floating mode |

### Workspaces
| Binding | Action |
|---------|--------|
| `Mod + [1-0]` | Switch to workspace |
| `Mod + Shift + [1-0]` | Move window to workspace |

### System Controls
| Binding | Action |
|---------|--------|
| `Mod + Shift + r` | Restart i3 |
| `Mod + Shift + e` | Exit i3 |
| `XF86AudioRaiseVolume` | Increase volume |
| `XF86AudioLowerVolume` | Decrease volume |
| `XF86AudioMute` | Toggle mute |

## Customization

### Wallpaper Configuration
```bash
# Set new wallpaper
feh --bg-fill ~/Pictures/your-wallpaper.jpg

# Make it persistent
cp ~/Pictures/your-wallpaper.jpg ~/.config/wallpaper/

# Update i3 configuration
# Edit ~/.config/i3/config to update the feh command
```

### Modifying Keybindings
1. Edit `~/.config/i3/config`
2. Reload i3 with `Mod + Shift + r`

### Terminal Customization
- **Font**: JetBrains Mono Nerd Font is configured by default
- **Themes**: Edit `~/.config/kitty/kitty.conf` to modify color schemes
- **Shell**: Add plugins to `~/.zshrc` in the plugins array

## Troubleshooting

### Font Display Issues
```bash
# Refresh font cache
fc-cache -fv
sudo fc-cache -fv
```

### i3blocks Status Bar
```bash
# Test i3blocks configuration
i3blocks -c ~/.config/i3blocks/config
```

### ZSH Configuration
```bash
# Reload ZSH configuration
source ~/.zshrc
```

## Maintenance

### Updating Configuration
```bash
cd ~/.dotfiles
git pull origin main
./install.sh
```

### Backup Current Configuration
```bash
# Create backup before updating
cp -r ~/.config ~/.config.backup.$(date +%Y%m%d)
```

## Contributing

Contributions are welcome! Please follow these guidelines:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

Please ensure all changes are:
- Well-documented
- Tested on a clean Arch installation
- Consistent with the existing code style

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [i3 Window Manager](https://i3wm.org/) community for the excellent tiling window manager
- [Neovim](https://neovim.io/) contributors for the modern text editor
- [Catppuccin](https://github.com/catppuccin/catppuccin) team for the beautiful color palette
- The broader dotfiles community for inspiration and best practices

---

**Note**: This configuration is optimized for the my workflow. Users may need to adjust paths, preferences, and keybindings to match their specific requirements and hardware setup.
