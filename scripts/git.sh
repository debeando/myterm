#!/bin/bash

echo "Git Config"
echo "----------"
echo "Please enter your user name: "
read name
echo "Please enter your e-mail: "
read email

git config --global push.default simple
git config --global color.ui auto
git config --global core.autocrlf input
git config --global core.excludesfile ~/.gitignore_global
git config --global user.name $name
git config --global user.email $email
git config --global push.default current
