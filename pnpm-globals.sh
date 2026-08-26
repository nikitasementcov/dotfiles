#!/usr/bin/env bash
#
# Install global pnpm packages.
#
# Idempotent: re-running is safe. Skips anything already installed.

set -euo pipefail

# Ensure pnpm's global bin dir is on PATH (normally set up by .zshrc, but
# install.sh may run this before that's sourced).
export PNPM_HOME="${PNPM_HOME:-$HOME/Library/pnpm}"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

PACKAGES=(
  oxlint
  oxfmt
)

for pkg in "${PACKAGES[@]}"; do
  if pnpm list -g "$pkg" >/dev/null 2>&1; then
    echo "pnpm-globals.sh: $pkg already installed"
  else
    echo "pnpm-globals.sh: installing $pkg"
    pnpm add -g "$pkg"
  fi
done
