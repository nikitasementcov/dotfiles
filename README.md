# Dotfiles

1. Clone that repo (~/dotfiles is preffered dir to use stow without extra arguments)
2. Run `./install.sh` to install Xcode Command Line Tools, `brew`, `asdf`, and Homebrew packages
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

## TODO:
* automate installation of zsh plugins
* install tmux plugin manager (tpm)[https://github.com/tmux-plugins/tpm] ??
* chrome extensions
