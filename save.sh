#!/bin/bash

cp ~/.zshrc .

timestamp=$(date +%s)

git add .
git commit -m "update config ${timestamp}"
git push
