PROMPT='$(zsh_vi_mode_prompt) %(!.%{$fg[red]%}.%{$fg[blue]%})%~$(git_prompt_info)$(get_repo_username)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[cyan]%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
function get_repo_username() {
    local repo_username
    repo_username=$(git config --local user.name 2>/dev/null)
    if [[ -n "$repo_username" ]]; then
        echo " %{$fg[magenta]%}[$repo_username]"
    fi
}
function zsh_vi_mode_prompt() {
  if [[ $KEYMAP == vicmd ]] || [[ $1 == 'block' ]]; then
      # Modo normal
      echo "%{$fg_bold[cyan]%}[N]"
  else
      # Modo de inserción
      echo "%{$fg_bold[cyan]%}[I]"
  fi
}

