#!/usr/bin/env bash

brew update
brew upgrade

brew install asdf

asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest
