#!/usr/bin/env bash
#
# Bootstrap a new machine: Xcode Command Line Tools, Homebrew, asdf, and
# Homebrew packages. Run this after cloning the repo (see README.md).
#
# Idempotent: re-running is safe.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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
sudo "${DOTFILES_DIR}/brew.sh"

echo "install.sh: done"
