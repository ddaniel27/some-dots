export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -d "/usr/local/go/bin" ] ; then
    PATH=$PATH:/usr/local/go/bin
fi

function zle-keymap-select {
  zle reset-prompt
}
zle -N zle-keymap-select

export EDITOR='vim'
export VISUAL='vim'
export GOPATH=/home/ddaniel27/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:/home/ddaniel27/.local/bin/myscripts

alias sudo='sudo '
alias n='nvim'
alias N='nvim -S'
alias i='kitten icat'
unalias ls
unalias ll
unalias la

ll() {
    ls -lh --color=always "$@" | awk 'BEGIN {OFS=" ";} {if (NF == 9 && $7 ~ /^[1-9]$/ ) $7 = "0"$7; print;}' | awk 'NF == 9{print $6" "$7" "$8" "$9}'
}
la() {
    ls -lha --color=always "$@" | awk 'BEGIN {OFS=" ";} {if (NF == 9 && $7 ~ /^[1-9]$/ ) $7 = "0"$7; print;}' | awk 'NF == 9{print $6" "$7" "$8" "$9}'
}

set -o vi
bindkey '^R' history-incremental-search-backward
