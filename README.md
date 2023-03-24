# Dotfiles

## Installation

### Prerequisites
- git
- gnu stow

### Clone Repo & Create Symlinks
```
cd ~
git clone <Add url here>  ~/.dotfiles

# Dryrun to preview links
stow -nv zsh git neovim   # whatever other else, can use "*/" for everything

# Run without -n to create links
stow -v zsh git neovim    # whatever other else, can use "*/" for everything
```

## Neovim

## Prerequisites
- Npm for some plugins / LSP's

## Install Plugins
Open Neovim session, wait for packer to install on startup (in `plugins.lua`), and run `:PackerSync`

