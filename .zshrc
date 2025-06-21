# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set Oh My Zsh theme
ZSH_THEME="robbyrussell"

# Initialize Oh My Posh with your specific theme file
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration and aliases can go here or in a separate file.
# For example, you can create a file like ~/.zsh_aliases and source it:
# source ~/.zsh_aliases

# Example aliases:
# alias zshconfig="code ~/.zshrc"
# alias ohmyzsh="code ~/.oh-my-zsh"

# Pokemon Colorscripts
pokemon-colorscripts -n ditto --no-title

export PATH=$PATH:/home/joshua/.spicetify
