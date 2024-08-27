#!/usr/bin/env bash
# 1-package-managers.sh
set -x
COMMON_PROFILE=.vprofile

sudo apt-get update
sudo apt-get upgrade -y

[ $(which flatpak) ] || echo "*** flatpak will now be installed; restart required ***"

sudo apt-get install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo apt-get install -y snapd

sudo apt-get autoremove && sudo apt-get clean

sudo flatpak update
sudo snap refresh 

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
cat $HOME/$COMMON_PROFILE | grep 'brew shellenv' > /dev/null || \
    (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> $HOME/$COMMON_PROFILE

mkdir -p $HOME/.local/bin
cat $HOME/$COMMON_PROFILE | grep '$HOME/.local/bin:$PATH' > /dev/null || \
    (echo; echo 'export PATH=$HOME/.local/bin:$PATH') >> $HOME/$COMMON_PROFILE

printf 'please run:\nsource $HOME/.vprofile\n'
