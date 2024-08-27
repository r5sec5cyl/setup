#!/usr/bin/env bash
# 3-apps.sh

# prefer apt wherever practical

COMMON_PROFILE=.vprofile

brew update
export HOMEBREW_NO_AUTO_UPDATE=1

sudo apt-get install -y jq
sudo snap install yq
sudo apt-get install -y wget
sudo apt-get install -y procps
sudo apt-get install -y bat
brew install tlrc

sudo snap install --classic aws-cli

sudo snap install --classic kubectl
sudo snap install --classic helm
brew install stern

# sudo snap install --classic android-studio
sudo snap install --classic codium
sudo apt-get install -y meld

brew install tig gitui
sudo apt-get install -y git-cola
sudo apt-get install -y kitty
sudo apt-get install -y xclip

type zed > /dev/null || curl -f https://zed.dev/install.sh | sh

### app configurations ###

[ $(which bat) ] || sudo ln -s /usr/bin/batcat $HOME/.local/bin/bat

entry=$(cat $HOME/$COMMON_PROFILE | grep 'code() {')
if [ -z "$entry" ]; then
    cat <<EOF >> $HOME/$COMMON_PROFILE

code() {
    codium \$@
}   
EOF
fi

entry=$(cat $HOME/$COMMON_PROFILE | grep 'alias xc')
if [ -z "$entry" ]; then
    cat <<EOF >> $HOME/$COMMON_PROFILE

alias xc='xclip -selection clipboard'
EOF
fi

kitty_conf=~/.config/kitty/kitty.conf
mkdir -p $(dirname $kitty_conf)
touch $kitty_conf
cat $kitty_conf | grep new_tab_with_cwd > /dev/null || echo "map alt+t new_tab_with_cwd" >> $kitty_conf
