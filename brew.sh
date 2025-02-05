#!/usr/bin/env bash

# Refs:
# --- https://github.com/Homebrew/homebrew-bundle
# --- https://github.com/mathiasbynens/dotfiles

brew update
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# DON'T FORGET to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

brew install --cask google-chrome
brew install --cask alacritty

brew install moreutils
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion2
brew install zsh
brew install stow
brew install dockutil

sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;


# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install tmux
brew install neovim
brew install grep
brew install ripgrep
brew install openssh
brew install screen
brew install gmp
brew install wget
brew install lazygit
brew install fzf
brew install zsh-syntax-highlighting

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install jesseduffield/lazygit/lazygit
brew install gs
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli
brew install bottom # btm

# brew install --cask microsoft-teams
# brew install --cask slack
# brew install --cask discord

brew install --cask docker
brew install docker-compose
brew install --cask telegram
brew install --cask notion
brew install --cask notion-calendar
brew install --cask zoom
brew install --cask spotify
brew install --cask raycast
brew install --cask karabiner-elements
brew install --cask postman
brew install --cask rize
brew install --cask nikitabobko/tap/aerospace
brew install --cask anki
brew install --cask chatgpt

brew install --cask visual-studio-code
brew install --cask font-hack-nerd-font
brew install --cask db-browser-for-sqlite
brew install --cask xnconvert
brew install --cask transnomino

# Remove outdated versions from the cellar.
brew cleanup
