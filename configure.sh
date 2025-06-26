#!/usr/bin/env bash

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


if ! grep -Fxq "source $REPO_DIR/.fufsrc" ~/.bashrc ; then
    echo -e "\nsource $REPO_DIR/.fufsrc" >> ~/.bashrc
fi

ln -sf $REPO_DIR/.tmux.conf ~/.tmux.conf
