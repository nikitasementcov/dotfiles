#!/usr/bin/env bash
#
# Uninstall tools installed by extras.sh.
#
# Idempotent: re-running is safe. Skips anything already uninstalled.
# Add one guarded block per tool below (mirrors extras.sh).

set -euo pipefail

# ---------- <name> ----------
if command -v <name> >/dev/null 2>&1; then
  echo "<name>: uninstalling"
  # command
else
  echo "<name>: not installed"
fi

echo "extras-uninstall.sh: done"
