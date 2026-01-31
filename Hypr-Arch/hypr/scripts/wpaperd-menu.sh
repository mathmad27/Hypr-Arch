#!/usr/bin/env bash
set -euo pipefail

choice="$(
  printf "󰒭  Next\n󰒮  Previous\n  Pause\n  Resume\n󰑓  Reload\n" \
  | wofi --dmenu --prompt "Wallpaper" --width 320 --lines 5 --matching fuzzy
)"

[ -z "${choice:-}" ] && exit 0

case "$choice" in
  *Next)     wpaperctl next-wallpaper ;;
  *Previous) wpaperctl previous-wallpaper ;;
  *Pause)    wpaperctl pause-wallpaper ;;
  *Resume)   wpaperctl resume-wallpaper ;;
  *Reload)   wpaperctl reload-wallpaper ;;
esac

