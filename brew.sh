#!/bin/bash

# Update to latest version of Homebrew
brew update

# Update already-installed packages
brew upgrade

brew install zsh tmux python wget pyenv pipenv

# brew tap Goles/battery
# brew install battery

# Remove outdated versions
brew cleanup
