#!/usr/bin/env bash
set -euo pipefail

# Icon + label menu lines
# (Icons rely on Font Awesome / Nerd Font. Swap to emojis if you prefer.)
entries=$(
  cat <<'EOF'
  Lock
󰤄  Suspend
󰍃  Logout
󰜉  Reboot
⏻  Shutdown
EOF
)

choice="$(printf "%s\n" "$entries" | wofi --dmenu --prompt "Power" --width 280 --lines 5 --matching fuzzy --hide-scroll)"

# No selection
[ -z "${choice:-}" ] && exit 0

# Strip icon + whitespace, keep the label
action="$(printf "%s" "$choice" | sed -E 's/^[^[:alnum:]]*[[:space:]]+//')"

lock_now() {
  # You use hyprlock
  hyprlock >/dev/null 2>&1 &
  disown || true
  sleep 0.3
}

case "$action" in
  loginctl lock-session)
    lock_now
    ;;
  Suspend)
    lock_now
    systemctl suspend
    ;;
  Logout)
    hyprctl dispatch exit
    ;;
  Reboot)
    systemctl reboot
    ;;
  Shutdown)
    systemctl poweroff
    ;;
esac

