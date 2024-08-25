#!/usr/bin/env bash
# 5-docker.sh

sudo snap install --classic docker
sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker
sudo snap disable docker
sudo snap enable docker
