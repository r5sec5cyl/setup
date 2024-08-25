#!/usr/bin/env bash
# 0-profile-setup.sh

COMMON_PROFILE=.vprofile
BASH_PROFILE=.bashrc
ZSH_PROFILE=.zprofile

touch $HOME/$COMMON_PROFILE
touch $HOME/$BASH_PROFILE
touch $HOME/$ZSH_PROFILE

cat $HOME/$BASH_PROFILE | grep "source \$HOME/$COMMON_PROFILE" > /dev/null || (echo; echo "source \$HOME/$COMMON_PROFILE") >> $HOME/$BASH_PROFILE
cat $HOME/$ZSH_PROFILE | grep "source \$HOME/$COMMON_PROFILE" > /dev/null || (echo; echo "source \$HOME/$COMMON_PROFILE") >> $HOME/$ZSH_PROFILE

cat $HOME/$COMMON_PROFILE | grep '.local/bin:$PATH' > /dev/null || \
echo 'export PATH=$HOME/.local/bin:$PATH' >> $HOME/$COMMON_PROFILE

cat $HOME/$COMMON_PROFILE | grep 'export PS1' > /dev/null || \
echo 'export PS1='"'"'\[\e]0;<\W> \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\D{%a %Y-%m-%d}\033[0;90mT\[\033[01;32m\]\t\[\033[00m\]:\[\033[01;34m\]../\W\[\033[00m\] \$ '"'" >> $HOME/$COMMON_PROFILE

