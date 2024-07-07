#!/usr/bin/env bash
# 6-docker.sh

brew update
export HOMEBREW_NO_AUTO_UPDATE=1

brew install colima
brew install docker docker-buildx

brew link docker

mkdir -p $HOME/.docker/cli-plugins
if [ $(uname -m) == "x86_64" ]; then
    ln -sfn /usr/local/opt/docker-buildx/bin/docker-buildx $HOME/.docker/cli-plugins/docker-buildx
else
    ln -sfn /opt/homebrew/bin/docker-buildx $HOME/.docker/cli-plugins/docker-buildx
fi

docker buildx install
