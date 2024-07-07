#!/usr/bin/env bash
# 5-languages.sh

set -- go python node rust zig
langs=""

for lang in "$@"; do
    read -p "Install $lang (y/n): " install
    if [[ $install = y* ]] || [[ $install = Y* ]]; then
        langs="$langs $lang"
    fi
done

if [[ $langs = *rust* ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

langs="$(echo $langs | sed 's#python#python pipenv#')"
langs="$(echo $langs | sed 's#rust##')"

brew install $langs
