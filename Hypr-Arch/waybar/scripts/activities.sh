#!/usr/bin/env bash
set -euo pipefail

# Your Hyprland config uses: $menu = hyprlauncher
if command -v hyprlauncher >/dev/null 2>&1; then
  exec hyprlauncher
fi

# Fallbacks
if command -v wofi >/dev/null 2>&1; then
  exec wofi --show drun
fi

if command -v rofi >/dev/null 2>&1; then
  exec rofi -show drun
fi

exit 0

