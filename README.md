# Dotfiles

0. Install `brew` - https://docs.brew.sh/Installation
`Xcode-select —install`
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
1. Clone that repo (~/dotfiles is preffered dir to use stow without extra arguments)
2. `brew install asdf`
3. Run `asdf.sh`
4. Run `sudo brew.sh`
5. Use GNU stow to create symlinks to the configs `stow nvim alacritty tmux`
6. Install chrome extensions like 1password
7. Generate ssh keys
8. Install apps manually from a store (e.g. Things 3)

## TODO:
* automate installation of zsh plugins
* karabiner config
* install tmux plugin manager (tpm)[https://github.com/tmux-plugins/tpm] ??
* run asdf before brew.sh (add it to the steps above)
* chrome extensions
* automate installation
