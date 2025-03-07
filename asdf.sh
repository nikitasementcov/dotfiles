#!/usr/bin/env bash

brew update
brew upgrade

brew install asdf

asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

asdf plugin add python
asdf install python latest
asdf global python latest

asdf plugin add rust
asdf install rust latest
asdf global rust latest

asdf plugin add java
asdf install java openjdk-17
asdf global java openjdk-17
