#!/bin/bash

cp ~/.config/nvim/init.lua .
cp ~/.zshrc .

timestamp=$(date +%s)

git add .
git commit -m "update config ${timestamp}"
git push
