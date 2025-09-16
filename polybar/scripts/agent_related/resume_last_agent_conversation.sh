#!/usr/bin/env sh

# Floating window
. "$HOME/.config/polybar/scripts/new_floating_window.sh"
# CODEX_BIN
. "$HOME/.config/polybar/scripts/agent_related/set_codex_bin.sh"

floating_kitty_window "800x900+550+450"

kitty --config "$KITTY_CONF" --title "New chat" sh -c \
  "$CODEX_BIN resume --last -a untrusted" < /dev/null
