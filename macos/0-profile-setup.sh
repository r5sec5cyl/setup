#!/usr/bin/env bash
# 0-profile-setup.sh

touch $HOME/.profile
touch $HOME/.bash_profile
touch $HOME/.zprofile

cat $HOME/.bash_profile | grep 'source $HOME/.profile' > /dev/null || (echo; echo 'source $HOME/.profile') >> $HOME/.bash_profile
cat $HOME/.zprofile | grep 'source $HOME/.profile' > /dev/null || (echo; echo 'source $HOME/.profile') >> $HOME/.zprofile
