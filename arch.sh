#!/usr/bin/env bash
#
# Install packages on Omarchy (Arch). Linux counterpart of brew.sh.
#
# Only lists what Omarchy doesn't already ship (neovim, tmux, herdr, lazygit,
# fzf, ripgrep, fd, jq, btop, docker, starship, zoxide, eza, mise, ... are
# preinstalled). Runtimes (node, python, rust, java, pnpm) and gh/claude come
# from mise, see mise.sh.
#
# Idempotent: re-running is safe (--needed skips installed packages).

set -euo pipefail

# ---------- official repos (pacman) ----------
packages=(
  stow
  ttf-hack-nerd

  # CLI
  glab
  yazi
  resvg
  git-lfs
  wget
  tree
  pv
  pigz
  7zip
  zopfli
  rlwrap
  moreutils
  lynx
  bottom # btm
  just
  asciinema
  dive
  busted
  syncthing

  # Apps
  telegram-desktop
  discord
  dbeaver
  anki
  vlc
  fbreader
)

sudo pacman -S --needed --noconfirm "${packages[@]}"

# ---------- AUR / Omarchy repo (yay) ----------
aur_packages=(
  ack
  hunk
  exercism-bin
  visual-studio-code-bin
  postman-bin
  zoom
  dropbox
  xnconvert
)

if command -v yay >/dev/null 2>&1; then
  yay -S --needed --noconfirm "${aur_packages[@]}"
else
  echo "arch.sh: yay not found; skipping AUR packages: ${aur_packages[*]}" >&2
fi

echo "arch.sh: done"
