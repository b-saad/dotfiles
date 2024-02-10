bindkey -e

# -- History command configuration --
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# -- Autocompletion
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh

# -- Aliases --
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gs='git status'
alias gco='git checkout'
alias tf='terraform'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

eval "$(starship init zsh)"
