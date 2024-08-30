#!/usr/bin/env bash
# 3-apps.sh

# prefer apt wherever practical

COMMON_PROFILE=".vprofile"

sudo apt-get install -y jq
sudo snap install yq
sudo apt-get install -y wget
sudo apt-get install -y procps
sudo apt-get install -y bat

sudo snap install --classic aws-cli

sudo snap install --classic kubectl
sudo snap install --classic helm

# sudo snap install --classic android-studio
sudo snap install --classic codium
sudo apt-get install -y meld

sudo apt-get install -y git-cola
sudo apt-get install -y kitty
sudo apt-get install -y xclip
sudo apt-get install -y zsh

brew install \
  tlrc \
  stern \
  tig \
  gitui \
  dasel

which zed || curl -f https://zed.dev/install.sh | sh

### app configurations ###

which bat || sudo ln -s /usr/bin/batcat "${HOME}/.local/bin/bat"


grep -q "code() {" "${HOME}/${COMMON_PROFILE}" || \
  cat <<EOF >> "${HOME}/${COMMON_PROFILE}"

code() {
    codium \$@
}   
EOF

grep -q "alias xc\|xc() {" "${HOME}/${COMMON_PROFILE}" || \
  cat <<EOF >> "$HOME/$COMMON_PROFILE"

alias xc='xclip -selection clipboard'
EOF

kitty_conf="${HOME}/.config/kitty/kitty.conf"
kitty_conf_dir=$(dirname "${kitty_conf}")
mkdir -p "${kitty_conf_dir}"
touch "${kitty_conf}"
grep -q "new_tab_with_cwd" "${kitty_conf}" || \
  echo "map alt+t new_tab_with_cwd" >> "${kitty_conf}"
