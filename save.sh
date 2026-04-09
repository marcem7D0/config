#!/bin/bash

cp ~/.config/emacs/init.el .

timestamp=$(date +%s)

git add .
git commit -m "update config ${timestamp}"
git push
