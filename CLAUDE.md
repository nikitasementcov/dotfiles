# AGENTS.md / CLAUDE.md

## Repo Shape

- This is a GNU Stow dotfiles repo; top-level directories are packages to symlink from the repo root, e.g. `stow zsh tmux claude herdr LazyVim`.
- `LazyVim` and `NvChad` intentionally stow to separate Neovim app names: `~/.config/LazyVim` and `~/.config/NvChad`, not `~/.config/nvim`.
- `zsh/.zshrc` sets `NVIM_APPNAME=LazyVim`; use `nvim-chad`, `nvim-lazy`, or `nvim-default` aliases when testing profile-specific behavior.
- `claude/.claude/` is the stowed Claude Code config; `~/.claude/settings.json` and top-level `~/.claude.json` are deliberately not stowed because they contain mutable state.

## Setup Commands

- Main macOS bootstrap is `./install.sh`; it installs Xcode CLT, Homebrew, `asdf`, global pnpm packages, then runs `sudo ./brew.sh`.
- `./brew.sh` is not a declarative Brewfile; it performs `brew update`, `brew upgrade`, installs packages/casks, changes shells, and runs `brew cleanup`.
- `./asdf.sh` installs latest Node.js, Python, Rust, Java `openjdk-17`, and latest pnpm via asdf.
- `./pnpm-globals.sh` installs global `oxlint` and `oxfmt`, temporarily adding `$HOME/Library/pnpm/bin` to `PATH` if needed.
- `./claude.sh` is idempotent and manages Claude Code marketplaces/plugins; it requires the `claude` CLI from the `claude-code` cask.
- `./extras.sh` is currently only a guarded template; do not claim it installs real tools until blocks are added.

## Manual Follow-Ups

- After stowing tmux, install TPM with `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`, then press `prefix + I` inside tmux.
- After zsh setup, install or verify Oh My Zsh, Powerlevel10k, and zsh-syntax-highlighting; `brew.sh` installs zsh-syntax-highlighting and Oh My Zsh, while `zsh/README.md` documents manual fallback commands.
- After LazyVim setup, finish plugin/tool installation from Neovim with `:Lazy` and `:MasonInstallAll`.
- Windows setup is manual-first: install Chocolatey, uncomment desired `choco.sh` lines, then follow `WIN_README.md` and use Stow from WSL.

## Verification

- There is no repo-wide build, test, lint, CI, or package manifest in this repository.
- For shell edits, run `bash -n <script>.sh`; most scripts use bash, but `macos.sh` is `#!/bin/bash` and mutates live macOS defaults.
- For Lua/Neovim edits, use the local formatting conventions: LazyVim `stylua.toml` and NvChad `.stylua.toml` both use 2-space indentation and 120-column width.
- Avoid running bootstrap scripts as verification unless explicitly asked; they install packages, modify shells, or change system settings.

## File Hygiene

- Preserve `.gitignore` exceptions for `claude/.claude/**`; otherwise nested dotfiles under stowed packages can be accidentally ignored.
- Do not replace `claude.sh` with raw settings snapshots; it is the source of truth for plugin/marketplace setup, while Claude settings may churn.
