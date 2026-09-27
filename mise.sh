#!/usr/bin/env bash
#
# Install language runtimes with mise (Omarchy's version manager).
# Linux counterpart of asdf.sh; mise also reads .tool-versions files.
#
# Idempotent: re-running is safe. Node.js is already managed by Omarchy's
# ~/.config/mise/config.toml.

set -euo pipefail

if ! command -v mise >/dev/null 2>&1; then
  echo "mise not found; it ships with Omarchy (or: sudo pacman -S mise)." >&2
  exit 1
fi

mise use --global \
  python@latest \
  rust@latest \
  java@openjdk-17 \
  pnpm@latest

echo "mise.sh: done"
