#!/usr/bin/env sh
set -euo pipefail

STATE_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/polybar/docker_context"
CTX="local"
[[ -f "$STATE_FILE" ]] && CTX="$(cat "$STATE_FILE" || echo local)"

if [[ "$CTX" == "mac" ]]; then
  # Si falla (sin contexto o sin docker remoto), imprime 0
  count=$(docker --context mac ps -q 2>/dev/null | wc -l || echo 0)
  echo "󰀵 ${count}"
else
  count=$(docker ps -q 2>/dev/null | wc -l || echo 0)
  echo "󰣇 ${count}"
  
fi
