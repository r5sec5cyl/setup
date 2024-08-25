#!/usr/bin/env bash
# 2-git.sh

if [[ $(git config --global user.email) ]]; then
    echo "git global config already set ($(git config --global user.name)/$(git config --global user.email))"
    read -p "Update (y/n): " update
fi

if [[ $update != n* ]] && [[ $update != N* ]]; then
    echo "Configure git global config: "
    read -p "name: " git_name
    read -p "email: " git_email

    git config --global --replace-all user.name "$git_name"
    git config --global --replace-all user.email "$git_email"
fi

email=$(git config --global user.email)
host_name=github.com
key_path=$HOME/.ssh/${host_name}

if [ ! -f ${key_path} ]; then
    ssh-keygen -t ed25519 -C "${email}" -f "${key_path}" -N ""
    eval "$(ssh-agent -s)"
    ssh-add "${key_path}"
    echo "Key created and added to agent."
fi

echo "TODO: Please ensure the following public key is added to github. " \
    "https://$host_name/settings/keys"
cat ${key_path}.pub

touch $HOME/.ssh/config
entry=$(cat $HOME/.ssh/config | grep "HostName ${host_name}")
if [ -z "$entry" ]; then
    cat <<EOF >> $HOME/.ssh/config

Host ${host_name}
    HostName ${host_name}
    AddKeysToAgent yes
    IdentityFile ${key_path}
EOF
    echo "ssh config updated"
else
    echo "Host entry already present in ssh config."
fi