#!/usr/bin/env bash
# 1-package-managers.sh

COMMON_PROFILE=".vprofile"
FLATPAK_REMOTE="https://dl.flathub.org/repo/flathub.flatpakrepo"
HOMEBREW_INSTALL_SCRIPT="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

sudo apt-get update
sudo apt-get upgrade -y

which flatpak || echo "WARNING: installing flatpak; restart will be required"

sudo apt-get install -y flatpak
flatpak remote-add --if-not-exists flathub "${FLATPAK_REMOTE}"

sudo apt-get install -y snapd

sudo apt-get autoremove && sudo apt-get clean
sudo flatpak update
sudo snap refresh 

/bin/bash -c "$(curl -fsSL ${HOMEBREW_INSTALL_SCRIPT})"
grep -q "brew shellenv" "${HOME}/${COMMON_PROFILE}" || \
  (echo; echo "[[ \${PATH} == *\"linuxbrew\"* ]]  ||\
  eval \"\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\"") \
  >> "${HOME}/${COMMON_PROFILE}"

printf "please run:\nsource \${HOME}/.vprofile\n"
