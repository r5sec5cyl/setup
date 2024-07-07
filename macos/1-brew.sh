#!/usr/bin/env bash
# 1-brew.sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ ! $(cat $HOME/.profile | grep '/opt/homebrew/bin/brew shellenv') ]]; then
    echo; echo '### BREW ENV VARS ###' >> $HOME/.profile
    (echo 'eval "$(/opt/homebrew/bin/brew shellenv)"';echo) >> $HOME/.profile
fi

if [[ $(git config --global user.email) ]]; then
    echo "git global config already set ($(git config --global user.name)/$(git config --global user.email))"
    read -p "Update (y/n): " update
    if [[ $update != y* ]] && [[ $update != Y* ]]; then
        exit 0
    fi
fi

echo "Configure git global config: "
read -p "name: " git_name
read -p "email: " git_email

git config --global --replace-all user.name "$git_name"
git config --global --replace-all user.email "$git_email"
