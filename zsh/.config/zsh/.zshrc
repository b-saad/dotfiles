bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/home/bsaad/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# -- History command configuration --
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# -- Aliases --
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gs='git status'
alias gco='git checkout'

eval "$(starship init zsh)"

