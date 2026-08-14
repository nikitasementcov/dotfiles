#!/usr/bin/env bash
#
# Install tools that aren't available via Homebrew or have another recommended way of installation
#
# Idempotent: re-running is safe. Skips anything already installed.
# Add one guarded block per tool below.

set -euo pipefail

# ---------- <name> ----------
if command -v <name> >/dev/null 2>&1; then
  echo "<name>: already installed"
  # command
else
  echo "<name>: installing"
fi

echo "extras.sh: done"
