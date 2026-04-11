#!/bin/bash

if [ -d "~/.emacs.d" ]; then
    rm -rf ~/.emacs.d
fi

mkdir -p ~/.config/emacs

cp ./init.el ~/.config/emacs/init.el
cp ./.zshrc ~/.zshrc
