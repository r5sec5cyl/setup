#!/usr/bin/env bash
# 0-profile-setup.sh

COMMON_PROFILE=".vprofile"
BASH_PROFILE=".bashrc"
ZSH_PROFILE=".zshrc"

touch "$HOME/$COMMON_PROFILE"
touch "$HOME/$BASH_PROFILE"
touch "$HOME/$ZSH_PROFILE"

grep -q "source \"\$HOME/$COMMON_PROFILE\"" "$HOME/$BASH_PROFILE" || \
  (echo; echo "source \"\$HOME/$COMMON_PROFILE\"") >> "$HOME/$BASH_PROFILE"

grep -q "source \"\$HOME/$COMMON_PROFILE\"" "$HOME/$ZSH_PROFILE"  || \
  (echo; echo "source \"\$HOME/$COMMON_PROFILE\"") >> "$HOME/$ZSH_PROFILE"

mkdir -p "${HOME}/.local/bin"
grep -q ".local/bin:\${PATH}" "$HOME/$COMMON_PROFILE" || \
  echo "[[ \${PATH} == *\".local/bin\"* ]]  ||\
  export PATH=\${HOME}/.local/bin:\${PATH}" >> "$HOME/$COMMON_PROFILE"

grep -q "export PS1" "$HOME/$COMMON_PROFILE" || \
    cat <<EOF >> "$HOME/$COMMON_PROFILE"

export PS1='\[\e]0;<\W> \w\a\]\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\D{%a %Y-%m-%d}\033[0;90mT\[\033[01;32m\]\t\[\033[00m\]:\[\033[01;35m\]../\W\[\033[00m\] \$ '
export PROMPT='%B%F{green}%D{%a %Y-%m-%d}%f%bT%B%F{green}%*:%F{magenta}%2~%f%b %# '
EOF
