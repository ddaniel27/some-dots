#!/usr/bin/env sh

set -euo pipefail
STATE_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/polybar/docker_context"
mkdir -p "$(dirname "$STATE_FILE")"
[[ -f "$STATE_FILE" ]] && CURRENT="$(cat "$STATE_FILE")" || CURRENT=local
echo "$([[ "$CURRENT" = mac ]] && echo local || echo mac)" > "$STATE_FILE"
