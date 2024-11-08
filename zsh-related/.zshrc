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
export GOPRIVATE='github.mheducation.com'
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/.local/bin/myscripts:$HOME/.local/bin:$HOME/.cargo/bin

alias sudo='sudo '
alias n='nvim'
alias N='nvim -S'
alias i='kitten icat'
alias ssh='kitten ssh'
alias dc='docker-compose'
alias zt='zathura'
unalias ls
unalias ll
unalias la

ll() {
    ls -lh --color=always "$@" | awk 'BEGIN {OFS=" ";} {if (NF >= 9 && $7 ~ /^[1-9]$/ ) $7 = "0"$7; print;}' | awk 'NF >= 9{ for (i=6; i<=NF; i++) printf $i" "; print ""; }'
}
la() {
    ls -lha --color=always "$@" | awk 'BEGIN {OFS=" ";} {if (NF >= 9 && $7 ~ /^[1-9]$/ ) $7 = "0"$7; print;}' | awk 'NF >= 9{ for (i=6; i<=NF; i++) printf $i" "; print ""; }'
}

sshmac() {
 ssh daniel.dorado@192.168.20.16
}

setssh() {
  eval "$(ssh-agent -s)"
  for key in $HOME/.ssh/id_*; do
    if [[ -f "$key" && ! "key" =~ \.pub$ ]]; then
      ssh-add "$key"
    fi
  done
}

set -o vi
bindkey '^R' history-incremental-search-backward
