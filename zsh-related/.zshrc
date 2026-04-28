export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function zle-keymap-select {
  zle reset-prompt
}
zle -N zle-keymap-select

# Env Vars settings
export EDITOR='vim'
export VISUAL='vim'
export MACHINE_ENV='personal'
export REMOTE_WORK_MACHINE_ADDRESS='192.168.20.88'

# Go settings
export GOPATH=$HOME/go

# Path settings
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin

# Aliases settings
alias sudo='sudo '
alias n='nvim'
alias N='nvim -S'
alias nob='nvim +Obsidian'
alias dbui='nvim +DBUI'
alias i='kitten icat'
alias ssh='kitten ssh'
alias dc='docker compose'
alias zt='zathura'
alias tf='terraform'
unalias ls

# Custom list files
unalias ll
ll() {
    ls -lh --color=always "$@" | awk 'BEGIN {OFS=" ";} {if (NF >= 9 && $7 ~ /^[1-9]$/ ) $7 = "0"$7; print;}' | awk 'NF >= 9{ for (i=6; i<=NF; i++) printf $i" "; print ""; }'
}

# Custom list all files
unalias la
la() {
    ls -lha --color=always "$@" | awk 'BEGIN {OFS=" ";} {if (NF >= 9 && $7 ~ /^[1-9]$/ ) $7 = "0"$7; print;}' | awk 'NF >= 9{ for (i=6; i<=NF; i++) printf $i" "; print ""; }'
}

# Direct ssh
sshmac() {
 kitten ssh daniel.dorado@$REMOTE_WORK_MACHINE_ADDRESS
}

# Set vi mode in console
set -o vi
bindkey '^R' history-incremental-search-backward
