#!/usr/bin/env bash
# 4-languages.sh

# python
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update
latest_stable_python="$(curl https://endoflife.date/api/python.json | jq -r \".[0].cycle\")"
sudo apt-get install -y "python${latest_stable_python}"
if [[ -z "${SET_DEFAULT_PYTHON}" ]]; then
  sudo update-alternatives --install /usr/bin/python3 python3 "/usr/bin/python${latest_stable_python}"
  which python || sudo ln -s "$(which python3)" "${HOME}/.local/bin/python"
fi

# go
sudo snap install --classic go

# node
NVM_RELEASES="https://api.github.com/repos/nvm-sh/nvm/releases"
latest_stable_nvm=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "${NVM_RELEASES}" | jq -r ".[0].tag_name")
NVM_INSTALL_SCRIPT="https://raw.githubusercontent.com/nvm-sh/nvm/${latest_stable_nvm}/install.sh"
curl -o- "${NVM_INSTALL_SCRIPT}" | bash

export NVM_DIR="${HOME}/.nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"  # This loads nvm
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"  # This loads nvm bash_completion

nvm install --lts

# rust
sudo curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# zig
sudo snap install zig --classic --beta

source "${HOME}/.bashrc"

echo
echo "nvm --version"
nvm --version
set -x
node -v
python --version
go version
rustup -V
cargo -V
zig version
