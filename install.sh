#!/usr/bin/env bash
#
# Bootstrap a new machine. Run this after cloning the repo (see README.md).
#
#   macOS:        Xcode Command Line Tools, Homebrew, asdf, Homebrew packages
#   Omarchy/Arch: pacman/yay packages (arch.sh), mise runtimes (mise.sh)
#
# Idempotent: re-running is safe.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install_macos() {
  if ! xcode-select -p >/dev/null 2>&1; then
    echo "install.sh: installing Xcode Command Line Tools"
    xcode-select --install
  else
    echo "install.sh: Xcode Command Line Tools already installed"
  fi

  if ! command -v brew >/dev/null 2>&1; then
    echo "install.sh: installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "install.sh: Homebrew already installed"
  fi

  eval "$(/opt/homebrew/bin/brew shellenv)"

  brew install asdf

  "${DOTFILES_DIR}/asdf.sh"
  "${DOTFILES_DIR}/pnpm-globals.sh"
  sudo "${DOTFILES_DIR}/brew.sh"
}

install_linux() {
  if ! command -v pacman >/dev/null 2>&1; then
    echo "install.sh: only Arch-based Linux (Omarchy) is supported" >&2
    exit 1
  fi

  if ! grep -qx 'ID=omarchy' /etc/os-release 2>/dev/null; then
    echo "install.sh: warning: not Omarchy; arch.sh assumes Omarchy's preinstalled packages" >&2
  fi

  "${DOTFILES_DIR}/arch.sh"
  "${DOTFILES_DIR}/mise.sh"
  "${DOTFILES_DIR}/pnpm-globals.sh"
}

case "$(uname -s)" in
Darwin) install_macos ;;
Linux) install_linux ;;
*)
  echo "install.sh: unsupported OS $(uname -s)" >&2
  exit 1
  ;;
esac

echo "install.sh: done"
