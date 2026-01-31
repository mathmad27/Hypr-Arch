# Hypr-Arch
### Please note this is a WIP and is still undergoing testing. I will update things as I remember/notice them. 
Personal Hyprland setup for Arch Linux — focused on a clean workflow, systemd user services, and sane defaults.

## What this repo is
This repository is a snapshot of my working desktop configuration:
- Hyprland compositor configuration
- Waybar setup 
- wofi menus (including icon support for launchers/menus)
- hypridle + hyprlock (screen-off, lock, suspend)
- wpaperd wallpaper daemon
- systemd user services to keep the session components always running

If you want something that’s easy to reapply after fresh installs, this is the point.

---

## Components included (by name)

> Names below are intentional — keeps them consistent across machines.

### Core
- `hyprland.conf`

### Bar / menus
- `waybar` config (Waybar JSON/CSS files as used in this setup)
- `wofi` config (used for menus, with icons)

### Lock / idle
- `hypridle` config (screen-off + lock + suspend policy)
- `hyprlock` config (lockscreen)

### Wallpapers
- `wpaperd` config (wallpaper daemon)
- `wpaperctl` usage (wallpaper switching)

### systemd user services
- `waybar.service`
- `hypridle.service`
- `wpaperd.service`

---

## Idle policy

This setup uses systemd + hypridle and follows this timing:

- Screen off (DPMS): **10 minutes**
- Lock: **15 minutes**
- Suspend: **20 minutes**

Locking is handled through the session lock mechanism, with hyprlock as the lockscreen.

---

## How to apply this on a new install

### 1) Install the basics
Install Hyprland + the tools this config expects (Waybar, wofi, hypridle, hyprlock, wpaperd, etc.).  
(Exact package list can vary depending on your Arch preferences; the goal is to match the components listed above.)

### 2) Put configs where they belong
Copy the configuration files from this repo into the appropriate config locations for:
- Hyprland
- Waybar
- wofi
- hypridle
- hyprlock
- wpaperd
- systemd user units

### 3) Enable the user services
Enable and start the services:

```bash
systemctl --user daemon-reload
systemctl --user enable --now waybar.service
systemctl --user enable --now hypridle.service
systemctl --user enable --now wpaperd.service
