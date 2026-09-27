# Dotfiles

1. Clone that repo (~/dotfiles is preffered dir to use stow without extra arguments)
2. Run `./install.sh` to install Xcode Command Line Tools, `brew`, `asdf`, Homebrew packages, and global pnpm packages
3. Run `./extras.sh` to install tools not available via Homebrew or have another recommended way of installation
4. Use GNU stow to create symlinks to the configs `stow nvim alacritty tmux claude herdr`
   - Run `./claude.sh` to install Claude Code plugins and MCP servers (see `claude/README.md`)
5. Install chrome extensions like 1password
6. Generate ssh keys
7. Install apps manually from a store (e.g. Things 3)
8. Set up startup applications manually
9. Install zsh and tmux plugins, check nested Readme files
10. To finish nvim installation run `:Lazy` and `:MasonInstallAll`
11. Config git global and local settings, like `git config set --global user.email ...`

## Omarchy (Arch Linux)

Omarchy ships its own bash, tmux, herdr, terminal, and Neovim configs wired into its theme switcher. On Omarchy the dotfiles layer on top of those instead of replacing them.

1. Clone to `~/dotfiles` and run `./install.sh`. On Linux it runs `arch.sh` (pacman/yay packages Omarchy doesn't ship), `mise.sh` (python, rust, java, pnpm via mise), and `pnpm-globals.sh`.
2. `install -d -m 700 ~/.ssh` **before** stowing `ssh`. Otherwise stow symlinks the whole directory into the repo and new keys would land in git.
3. Dry-run stow and move any conflicting Omarchy files to a backup dir. Never use `--adopt`, because it overwrites repo files with the machine's copies:
   ```sh
   stow -n -v shell bash git ssh tmux herdr lazygit claude LazyVim NvChad vim opencode hypr
   # typical conflicts: ~/.bashrc ~/.config/herdr/config.toml ~/.config/lazygit/config.yml
   #                    ~/.claude/settings.json ~/.config/opencode/opencode.json ~/.config/hypr/input.lua
   stow shell bash git ssh tmux herdr lazygit claude LazyVim NvChad vim opencode hypr
   ```
4. Don't stow these on Omarchy: `zsh` (Omarchy uses bash; shared aliases live in `shell`), `alacritty`, `ghostty`, `wezterm` (they would replace Omarchy's themed configs), and the macOS-only `aerospace`, `karabiner`, `vscode`.
5. Look & feel through Omarchy: `omarchy-theme-set "Tokyo Night"`, and pick Hack Nerd Font from the Omarchy font menu.
6. SSH: `ssh-keygen -t ed25519`, then `systemctl --user enable --now ssh-agent` (`bash/.bashrc` picks up its socket).
7. Create `~/.gitconfig.local` (not stowed) with the machine's identity:
   ```ini
   [user]
     name = Nikita Sementsov
     email = sementcov.nikita@gmail.com
   ```
   On macOS use the work email there, and put the Sourcetree `difftool`/`mergetool` sections in it too.
8. Run `./claude.sh`, install TPM (see Manual Follow-Ups), and in Neovim run `:Lazy`.

How the layering works:
- `bash/.bashrc` is Omarchy's template: it sources `$OMARCHY_PATH/default/bash/rc` (starship, mise, zoxide, aliases), then `~/.config/shell/common.sh`, which is shared with `zsh/.zshrc`.
- `tmux/.tmux.conf` first sources Omarchy's `~/.config/tmux/tmux.conf` (tmux loads only the first config it finds), then applies my overrides. The `tmux-power` theme only loads on macOS.
- `herdr/.config/herdr/config.toml` is Omarchy's herdr config merged with my keys, because herdr has no includes. Validate it with `herdr config check`.
- The `LazyVim` profile loads Omarchy's Neovim extras from the `omarchy-nvim` package (`/etc/skel/.config/nvim`): live theme reload on `omarchy-theme-set`, all theme plugins, transparent background, and the wl-copy/OSC52 clipboard inside tmux, herdr and ssh. `lua/config/lazy.lua` creates a gitignored `lua/plugins/theme.lua` symlink to the current theme. All of this is skipped on macOS. The theme plugins are cloned normally and are pinned in `lazy-lock.json`.
- Omarchy's `~/.config/git/config` still applies, and `~/.gitconfig` overrides it.

## Repo Shape

- This is a GNU Stow dotfiles repo; top-level directories are packages to symlink from the repo root, e.g. `stow zsh tmux claude herdr LazyVim`.
- `LazyVim` and `NvChad` intentionally stow to separate Neovim app names: `~/.config/LazyVim` and `~/.config/NvChad`, not `~/.config/nvim`.
- `shell/.config/shell/common.sh` (sourced by `zsh/.zshrc` and `bash/.bashrc`) sets `NVIM_APPNAME=LazyVim`; use `nvim-chad`, `nvim-lazy`, or `nvim-default` aliases when testing profile-specific behavior.
- `claude/.claude/` is the stowed Claude Code config, including `settings.json`, `.omc-config.json`, and `CLAUDE.md`; only the top-level `~/.claude.json` is deliberately not stowed because it contains mutable state.

## Setup Commands

- Main bootstrap is `./install.sh`; on macOS it installs Xcode CLT, Homebrew, `asdf`, global pnpm packages, then runs `sudo ./brew.sh`.
- `./brew.sh` is not a declarative Brewfile; it performs `brew update`, `brew upgrade`, installs packages/casks, changes shells, and runs `brew cleanup`.
- `./asdf.sh` installs latest Node.js, Python, Rust, Java `openjdk-17`, and latest pnpm via asdf.
- `./pnpm-globals.sh` installs global `oxlint` and `oxfmt`, temporarily adding `$HOME/Library/pnpm/bin` to `PATH` if needed.
- On Omarchy/Arch, `./install.sh` runs `./arch.sh` (idempotent `pacman`/`yay -S --needed`), `./mise.sh` (`mise use --global` for python, rust, java `openjdk-17`, pnpm), and `./pnpm-globals.sh`.
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

## TODO:
* automate installation of zsh plugins
* install tmux plugin manager (tpm)[https://github.com/tmux-plugins/tpm] ??
* chrome extensions
