#!/usr/bin/env powershell
# 4-apps.ps1

choco -v
choco install -y jq
choco install -y yq
choco install -y tldr

choco install -y awscli

choco install -y kubernetes-cli
choco install -y helm
choco install -y stern

choco install -y vscode
choco install -y meld
choco install -y sourcetree
choco install -y firefox
