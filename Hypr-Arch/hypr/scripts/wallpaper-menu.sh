#!/usr/bin/env bash
set -euo pipefail

WALLDIR="${WALLDIR:-$HOME/Pictures/wallpapers}"

# Pick an image (add/remove extensions as you like)
pick="$(
  find "$WALLDIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) \
  | sort \
  | wofi --dmenu --prompt "Wallpaper" --width 700 --lines 12 --matching fuzzy
)"

[ -z "${pick:-}" ] && exit 0

# Absolute path is safest
wall="$(realpath "$pick")"

# Preload then apply to all monitors
hyprctl hyprpaper preload "$wall"
while IFS= read -r mon; do
  hyprctl hyprpaper wallpaper "$mon,$wall"
done < <(hyprctl monitors -j | jq -r '.[].name')

# Optional cleanup
hyprctl hyprpaper unload unused

