#!/usr/bin/env sh

# Floating window
. "$HOME/.config/polybar/scripts/new_floating_window.sh"

# --- Config ---
STATE_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/polybar/docker_context"
CTX="local"
[ -f "$STATE_FILE" ] && CTX="$(cat "$STATE_FILE" 2>/dev/null || echo local)"

DOCKER="docker"
TITLE="docker-ps (local)"
if [ "$CTX" = "mac" ]; then
  if docker --context mac version >/dev/null 2>&1; then
    DOCKER="docker --context mac"
    TITLE="docker-ps (mac)"
  else
    # Fallback
    DOCKER="docker"
    TITLE="docker-ps (local - fallback)"
  fi
fi

# Call window maker
floating_kitty_window

kitty --config "$KITTY_CONF" --title "$TITLE" sh -c \
  "$DOCKER ps -a --format 'table {{.Names}}\t{{.RunningFor}}\t{{.Status}}' 2>/dev/null || echo 'docker no disponible en este contexto'; sleep infinity" \
  < /dev/null
