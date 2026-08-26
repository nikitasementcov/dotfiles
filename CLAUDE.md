# Agent Instructions

- Use `README.md` as the source of truth for repository shape, setup commands, and manual follow-ups.
- Treat top-level directories as GNU Stow packages; do not flatten, rename, or restow package layouts unless explicitly asked.
- Preserve separate Neovim app profiles. `LazyVim` and `NvChad` stow to `~/.config/LazyVim` and `~/.config/NvChad`, not `~/.config/nvim`.
- For profile-specific Neovim checks, use the configured aliases such as `nvim-chad`, `nvim-lazy`, or `nvim-default` instead of assuming the default `nvim` profile.
- Do not claim `extras.sh` installs real tools unless guarded install blocks have been added.
- Do not run bootstrap scripts such as `install.sh`, `brew.sh`, `asdf.sh`, `pnpm-globals.sh`, `claude.sh`, `extras.sh`, or `macos.sh` for verification unless explicitly asked; they install packages, modify shells, or change system settings.
- For shell edits, run `bash -n <script>.sh` where applicable.
- For Lua/Neovim edits, follow the local formatting conventions: LazyVim `stylua.toml` and NvChad `.stylua.toml` both use 2-space indentation and 120-column width.
- Preserve `.gitignore` exceptions for `claude/.claude/**`; otherwise nested dotfiles under stowed packages can be accidentally ignored.
- Do not replace `claude.sh` with raw settings snapshots; it is the source of truth for Claude Code plugin and marketplace setup, while Claude settings may churn.
