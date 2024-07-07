#!/usr/bin/env bash
# 3-apps.sh

brew update
export HOMEBREW_NO_AUTO_UPDATE=1

brew install jq
brew install yq
brew install wget
brew install watch
brew install tldr

brew install awscli

brew install kubernetes-cli
brew install tfenv && tfenv install && tfenv use
brew install helm
brew install stern

brew install --cask visual-studio-code
brew install --cask meld
brew install --cask rectangle
brew install --cask sourcetree

unset HOMEBREW_NO_AUTO_UPDATE
