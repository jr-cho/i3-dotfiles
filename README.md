# i3 Dotfiles

A carefully curated collection of configuration files for a productive and aesthetically pleasing development environment on Arch-based distros, featuring i3wm, ZSH, Neovim, Tmux, and modern terminal tools.

## Features

* **i3 Window Manager** with custom keybindings and i3blocks status bar
* **Kitty Terminal** with JetBrains Mono Nerd Font
* **Neovim Configuration** with LSP, syntax highlighting, and productivity plugins
* **ZSH Shell** with Oh My Posh prompt and useful aliases
* **Tmux Terminal Multiplexer** for session management
* **Dunst Notifications** with clean, minimal styling
* **Picom Compositor** for transparency, shadows, and smooth animations
* **Dmenu** for quick app launching (optional theming with Catppuccin available)
* **Flameshot Screenshots** with GUI interface
* **Neofetch System Info** with personalized display
* **Zathura PDF Viewer** with vim-like keybindings
* **Wallpaper Management** using `feh` with automatic loading
* **Catppuccin Mocha Color Scheme** throughout the setup
* **Automated Installation Script** for easy setup

## Requirements

* **Arch Linux** (or Arch-based distribution)
* **yay** AUR helper ([installation guide](https://github.com/Jguer/yay))
* **Git** for cloning the repository
* **Base-devel** package group

## Installation

### Quick Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run the installation script:**

   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. **Reboot or restart your display manager** to apply all changes.

### Manual Installation

If you prefer to install manually or want to understand what's happening:

1. **Install required packages:**

   ```bash
   yay -S i3-wm i3blocks kitty neovim zsh tmux dunst picom dmenu neofetch zathura feh flameshot thunar firefox ttf-jetbrains-mono-nerd
   ```

2. **Copy configuration files:**

   ```bash
   cp -r .config/* ~/.config/
   cp .zshrc ~/.zshrc
   cp .tmux.conf ~/.tmux.conf
   ```

3. **Set ZSH as default shell:**

   ```bash
   chsh -s $(which zsh)
   ```

4. **Enable display manager (optional):**

   ```bash
   sudo systemctl enable ly.service  # or your preferred DM
   ```

## Configuration Overview

```
dotfiles/
├── .config/         # Main configuration directory
│   ├── dmenu/       # Application launcher configuration
│   ├── dunst/       # Notification daemon settings
│   ├── i3/          # i3 window manager configuration
│   ├── i3blocks/    # Status bar configuration and scripts
│   ├── kitty/       # Terminal emulator settings
│   ├── neofetch/    # System information tool config
│   ├── nvim/        # Neovim configuration
│   ├── ohmyposh/    # Shell prompt configuration
│   ├── picom/       # Compositor settings
│   ├── wallpaper/   # Desktop backgrounds
│   └── zathura/     # PDF viewer configuration
├── .tmux.conf       # Tmux terminal multiplexer config
├── .zshrc           # ZSH shell configuration
├── install.sh       # Automated package installation
└── README.md        # This file
```

## Development Tools (Optional)

The installation script offers to install additional development tools:

* **Languages:** Python, Rust (rustup), Go, Node.js
* **Package Managers:** pip, cargo, npm
* **Version Control:** Git with enhanced configuration
* **Database Tools:** SQLite, PostgreSQL client *(manual)*
* **Cloud Tools:** Docker, AWS CLI *(optional, install separately)*

## Customization

### Changing Wallpaper

```bash
feh --bg-fill ~/Pictures/your-wallpaper.jpg
cp ~/Pictures/your-wallpaper.jpg ~/.config/wallpaper/
# Edit ~/.config/i3/config to update feh command
```

### Modifying i3 Keybindings

Edit `~/.config/i3/config` and reload with `Mod+Shift+R`.

### Terminal Theme

Kitty uses JetBrains Mono Nerd Font. To change themes, edit `~/.config/kitty/kitty.conf`.

### Adding ZSH Plugins

Edit `~/.zshrc` and add plugins to the plugins array.

## Useful Commands

```bash
# i3 Window Manager
Mod+Return         # Open terminal (Kitty)
Mod+d              # Application launcher (dmenu)
Mod+f              # Firefox browser
Mod+c              # File manager (Thunar)
Mod+Shift+s        # Screenshot (Flameshot)
Mod+q              # Kill focused window

# Window Navigation
Mod+Arrow Keys     # Navigate windows
Mod+Shift+Arrow    # Move windows
Mod+w              # Tabbed layout
Mod+e              # Toggle split layout
Mod+Shift+Space    # Toggle floating

# Workspaces
Mod+[1-0]          # Switch to workspace
Mod+Shift+[1-0]    # Move window to workspace

# System
Mod+Shift+r        # Restart i3
Mod+Shift+e        # Exit i3

# Audio (Media Keys)
XF86AudioRaiseVolume    # Volume up
XF86AudioLowerVolume    # Volume down
XF86AudioMute           # Toggle mute
```

## Troubleshooting

### Font Issues

If icons don't display correctly:

```bash
fc-cache -fv
sudo fc-cache -fv
```

### i3blocks Not Loading

```bash
i3blocks -c ~/.config/i3blocks/config
```

### ZSH Not Loading Properly

```bash
source ~/.zshrc
```

## Updating

```bash
cd ~/.dotfiles
git pull
./install.sh
```

## Contributing

Feel free to fork this repository and submit pull requests for improvements. Please ensure your changes are well-documented and tested.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

* [i3 Window Manager](https://i3wm.org/) community
* [Neovim](https://neovim.io/) contributors
* [Starship](https://starship.rs/) developers
* Various dotfiles repositories that inspired this setup

---

**Note:** These dotfiles are configured for my personal workflow. You may need to adjust paths, preferences, and keybindings to match your setup.
