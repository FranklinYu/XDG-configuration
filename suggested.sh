#!/bin/sh

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install curl gedit-plugins tree

#####################
# Zsh and Oh-My-Zsh #
#####################

# install Z-shell
sudo apt-get install zsh zsh-doc

# set Z-shell as default shell
# (from http://superuser.com/a/231736 )
chsh -s $(which zsh)

# install Oh-My-Zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh

# set theme to gallois
# (from https://github.com/robbyrussell/oh-my-zsh/wiki/Themes#kolo )
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="gallois"/g' ~/.zshrc

# alias
cat suggested/.zshrc >> ~/.zshrc
