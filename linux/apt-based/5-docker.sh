#!/usr/bin/env bash
# 5-docker.sh

DOCKER_PPA="https://download.docker.com/linux/ubuntu"
DOCKER_KEYRING="/etc/apt/keyrings/docker.asc"

sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL "${DOCKER_PPA}/gpg" -o "${DOCKER_KEYRING}"
sudo chmod a+r "${DOCKER_KEYRING}"

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=${DOCKER_KEYRING}] ${DOCKER_PPA} \
  $(. /etc/os-release && echo $(lsb_release -cs)) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker
