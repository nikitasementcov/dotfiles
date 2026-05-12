# Claude Code

Two pieces:

- **`../claude.sh`** — installs marketplaces, plugins, and MCP servers via the `claude` CLI. Idempotent.
- **`./.claude/`** — files safe to symlink with `stow` (run `stow claude` from the repo root).
  - `commands/` — custom slash commands
  - `agents/` — custom subagents
  - `hooks/` — hook scripts

Settings (`~/.claude/settings.json`) and the top-level `~/.claude.json` are **not** stowed —
they mix durable config with mutable state (caches, dismissals, onboarding flags) that
would churn on every Claude Code run. Use `claude.sh` to declare plugins/MCPs instead.

## Usage

```sh
./claude.sh        # install/update plugins and MCPs
stow claude        # symlink commands/agents/hooks into ~/.claude/
```
