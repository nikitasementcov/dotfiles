# Claude Code

Two pieces:

- **`../claude.sh`** — installs marketplaces, plugins, and MCP servers via the `claude` CLI. Idempotent.
- **`./.claude/`** — files safe to symlink with `stow` (run `stow claude` from the repo root).
  - `commands/` — custom slash commands
  - `agents/` — custom subagents
  - `hooks/` — hook scripts
  - `skills/` — project skills
  - `settings.json` — Claude Code settings
  - `.omc-config.json` — oh-my-claudecode config
  - `CLAUDE.md` — oh-my-claudecode project instructions

The top-level `~/.claude.json` is **not** stowed — it mixes durable config with mutable
state (caches, dismissals, onboarding flags) that would churn on every Claude Code run.
Use `claude.sh` to declare plugins/MCPs instead.

## Usage

```sh
./claude.sh        # install/update plugins and MCPs
stow claude        # symlink commands/agents/hooks/settings/CLAUDE.md into ~/.claude/
```
