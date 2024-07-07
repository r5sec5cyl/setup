#!/usr/bin/env bash
# 4-bash.sh

brew install bash
sudo sh -c 'echo $(which bash) >> /etc/shells'
chsh -s $(which bash)

cat $HOME/.profile | grep 'export PS1' > /dev/null && \
echo 'export PS1='"'"'\033[0;33m\D{%a %Y-%m-%d}\033[0;90mT\033[0;33m\t \033[0;37m\u \033[0;36m../\W\033[0m $ '"'" >> $HOME/.profile
