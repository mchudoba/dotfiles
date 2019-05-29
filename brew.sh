#!/bin/bash

# Update to latest version of Homebrew
brew update

# Update already-installed packages
brew upgrade

brew install zsh tmux wget
brew install python pyenv pipenv
brew install zsh-syntax-highlighting zsh-autosuggestions

# brew tap Goles/battery
# brew install battery

# Remove outdated versions
brew cleanup
