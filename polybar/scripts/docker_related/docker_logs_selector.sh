#!/usr/bin/env sh
set -euo pipefail

# --- Config ---
STATE_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/polybar/docker_context"
CTX="local"
[ -f "$STATE_FILE" ] && CTX="$(cat "$STATE_FILE" 2>/dev/null || echo local)"

DOCKER="docker"
TITLE="docker logs (local)"

# Cargar helper de floating window (igual que tus scripts)
. "$HOME/.config/polybar/scripts/new_floating_window.sh"

if [ "$CTX" = "mac" ]; then
    if docker --context mac version >/dev/null 2>&1; then
        DOCKER="docker --context mac"
        TITLE="docker logs (mac)"
    else
        DOCKER="docker"
        TITLE="docker logs (local - fallback)"
    fi
fi

# --- Selector ---
# Detectamos si existe rofi; si no, usamos fzf.
choose_container() {
    if command -v rofi >/dev/null 2>&1; then
        rofi -dmenu -p "Selecciona contenedor" <<< "$($DOCKER ps -a --format '{{.Names}}')"
    else
        $DOCKER ps --format '{{.Names}}' | fzf --prompt="Selecciona contenedor: "
    fi
}

CONTAINER="$(choose_container)"

# Si está vacío o canceló
[ -z "$CONTAINER" ] && exit 0

# --- Floating window ---
floating_kitty_window

kitty --config "$KITTY_CONF" --title "$TITLE" sh -c \
    "$DOCKER logs -f \"$CONTAINER\" 2>&1 | sed 's/\x1b\[[0-9;]*m//g'; sleep infinity" \
    < /dev/null
