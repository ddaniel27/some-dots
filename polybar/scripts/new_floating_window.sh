#!/usr/bin/env sh

floating_kitty_window() {
  local rect="${1:-800x270+550+600}"
  KITTY_CONF="${KITTY_CONF_OVERRIDE:-$HOME/.config/kitty/kitty-noconfirm.conf}"

  bspc desktop --focus ^2
  bspc rule -a kitty -o state=floating rectangle="$rect" --one-shot
}
