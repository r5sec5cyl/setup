#!/usr/bin/env bash
# 2-git.sh

if [[ $(git config --global user.email) ]]; then
    echo "git global config already set ($(git config --global user.name)/$(git config --global user.email))"
    read -p "Update (y/n): " update
fi

if [[ ${update} != n* ]] && [[ ${update} != N* ]]; then
    echo "Configure git global config: "
    read -p "name: " GIT_NAME
    read -p "email: " GIT_EMAIL

    git config --global --replace-all user.name "${GIT_NAME}"
    git config --global --replace-all user.email "${GIT_EMAIL}"
fi

email=$(git config --global user.email)
host_name="github.com"
key_path="${HOME}/.ssh/${host_name}"
ssh_config_path="${HOME}/.ssh/config"

if [ ! -f ${key_path} ]; then
    ssh-keygen -t ed25519 -C "${email}" -f "${key_path}" -N ""
    eval "$(ssh-agent -s)"
    ssh-add "${key_path}"
    echo "Key created and added to agent."
fi

echo "TODO: Please ensure the following public key is added to github. " \
    "https://${host_name}/settings/keys"
cat ${key_path}.pub

touch "${ssh_config_path}"
if [[ ! $(grep "HostName ${host_name}" "${ssh_config_path}") ]] > /dev/null; then
    cat <<EOF >> "${ssh_config_path}"

Host ${host_name}
    HostName ${host_name}
    AddKeysToAgent yes
    IdentityFile ${key_path}
EOF
    echo "ssh config updated"
else
    echo "Host entry already present in ssh config."
fi
