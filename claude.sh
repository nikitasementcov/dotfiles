#!/usr/bin/env bash
#
# Install Claude Code plugins and MCP servers.
#
# Idempotent: re-running is safe. Skips anything already installed.
# Requires the `claude` CLI (installed via brew cask `claude-code` in brew.sh).

set -euo pipefail

if ! command -v claude >/dev/null 2>&1; then
  echo "claude CLI not found; install via brew first (see brew.sh)." >&2
  exit 1
fi

# ---------- marketplaces ----------
# Format: name|source
marketplaces=(
  "chrome-devtools-plugins|ChromeDevTools/chrome-devtools-mcp"
  "omc|Yeachan-Heo/oh-my-claudecode"
)

for entry in "${marketplaces[@]}"; do
  name="${entry%%|*}"
  source="${entry##*|}"
  if claude plugin marketplace list 2>/dev/null | grep -qE "(^|[[:space:]])${name}([[:space:]]|$)"; then
    echo "marketplace ${name}: already added"
  else
    echo "marketplace ${name}: adding from ${source}"
    claude plugin marketplace add "${source}"
  fi
done

# ---------- plugins ----------
# Format: plugin@marketplace
plugins=(
  "chrome-devtools-mcp@claude-plugins-official"
  "oh-my-claudecode@omc"
)

installed_plugins="$(claude plugin list 2>/dev/null || true)"
for plugin in "${plugins[@]}"; do
  if grep -qF "${plugin}" <<<"${installed_plugins}"; then
    echo "plugin ${plugin}: already installed"
  else
    echo "plugin ${plugin}: installing"
    claude plugin install "${plugin}" --scope user
  fi
done

# ---------- MCP servers ----------
# Add user-scope MCPs here. Examples:
#   claude mcp add --scope user --transport http sentry https://mcp.sentry.dev/mcp
#   claude mcp add --scope user my-server -- npx my-mcp-server
#
# Note: claude.ai integrations (Linear, Notion, Atlassian, etc.) are managed
# remotely via OAuth on claude.ai and cannot be provisioned from a script.
#
# Guard pattern for idempotency:
#   claude mcp get <name> >/dev/null 2>&1 || claude mcp add ...

# (no local MCPs configured yet)

echo "claude.sh: done"
