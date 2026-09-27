#!/usr/bin/env bash
#
# Install global pnpm packages.
#
# Idempotent: re-running is safe. Skips anything already installed.

set -euo pipefail

# Ensure pnpm's global bin dir is on PATH (normally set up by
# ~/.config/shell/common.sh, but install.sh may run this before that's sourced).
if [[ -z "${PNPM_HOME:-}" ]]; then
  case "$(uname -s)" in
  Darwin) PNPM_HOME="$HOME/Library/pnpm" ;;
  *) PNPM_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/pnpm" ;;
  esac
fi
export PNPM_HOME
case ":$PATH:" in
*":$PNPM_HOME/bin:"*) ;;
*) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

PACKAGES=(
  oxlint
  oxfmt
)

# `pnpm list -g <pkg>` exits 0 even when nothing matches (pnpm 12), so check
# the JSON dependency list instead.
installed="$(pnpm list -g --json 2>/dev/null || true)"

for pkg in "${PACKAGES[@]}"; do
  if grep -q "\"${pkg}\"" <<<"${installed}"; then
    echo "pnpm-globals.sh: $pkg already installed"
  else
    echo "pnpm-globals.sh: installing $pkg"
    pnpm add -g "$pkg"
  fi
done
