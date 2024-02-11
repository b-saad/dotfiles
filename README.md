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
- Golang
- Rust
- Python
- [ripgrep](https://github.com/BurntSushi/ripgrep) for Telescope live_grep
- Luarocks


## Install Plugins
Open Neovim session, wait for packer to install on startup (in `plugins.lua`), and run `:PackerSync`

## Mac OS Fonts

## Installing Fonts
`stow` won't work here, navigate to `.dotfiles/fonts-macs/Library/Fonts` in finder and just highlight and click all the fonts to install Fira Mono
