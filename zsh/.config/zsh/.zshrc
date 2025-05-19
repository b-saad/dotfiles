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
alias gp='git push'
alias gpl='git pull'
alias gc='git commit'
alias gd='git diff'
alias gs='git status'
alias gco='git checkout'
alias tf='terraform'

# Mac os ventura doesn't have python 2 installed anymore
alias python=/user/bin/python3

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# -- NVM --
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


# -- include per env custom files 
# usage: create .zsh files, in custom folder to be included ex work_aliases
for file in '$ZDOTDIR/custom/*'
do 
  if [[ -f "$file" && "${file:t}" != ".gitignore" ]]; then
    source "$file" 
  fi
done

# -- macOS specific --
# Put these in .zsh files in custom if needed
# macports
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# brew
# eval "$(/usr/local/bin/brew shellenv)"

eval "$(starship init zsh)"
