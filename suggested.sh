#!/bin/sh

cd "$(dirname "$(readlink -f "$0")")"

sudo apt-get update
SUDO_OK=$?
if [ SUDO_OK == 1 ] ; then
  echo "\033[1;31m\`sudo apt-get update\` returns 1, possibly due to wrong" \
    "password.\033[0m"
  exit 1
fi
sudo apt-get upgrade
sudo apt-get install curl gedit-plugins tree --assume-yes

#######
# Vim #
#######

sudo apt-get install vim --assume-yes
if [ -f ~/.vimrc ] ; then echo >> ~/.vimrc ; fi
cat suggested/.vimrc >> ~/.vimrc

#######
# Git #
#######

sudo apt-get install git --assume-yes

# add username and email
git config --global user.name 'Franklin Yu'
git config --global user.email franklinyu@hotmail.com

# ignore the temp files created by 'gedit' or 'Emacs'
git config --global core.excludesfile ~/.config/git/ignore
if [ -d ~/.config/git ] ; then mkdir ~/.config/git ; fi
if [ -f ~/.config/git/ignore ] ; then echo >> ~/.config/git/ignore ; fi
echo '# temporary files' >> ~/.config/git/ignore
  # quotation marks suppress parsing pound sign
echo '*~' >> ~/.config/git/ignore
  # quotation marks prevent wildcard from expansion

# push local branches to the remote branches that already exist with the same
# name
git config --global push.default matching

# color the text (is default since 1.8.4)
# from http://stackoverflow.com/q/10998792
# see also https://nathanhoad.net/how-to-colours-in-git
git config --global color.ui auto

# set `less` default pager and set tab width
# from http://stackoverflow.com/a/10584237
git config --global core.pager 'less -x1,5'

# set default editor as Vim
git config --global core.editor vim

#####################
# Zsh and Oh-My-Zsh #
#####################

# install Z-shell
sudo apt-get install zsh zsh-doc --assume-yes

# set Z-shell as default shell
# (from http://superuser.com/a/231736 )
USR_NAME=`id --user --name`
sudo chsh --shell $(which zsh) $USR_NAME

# install Oh-My-Zsh (needs Git)
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh \
  --output-document=- | sh

# alias
cat suggested/.zshrc >> ~/.zshrc

# append the path instead of replacing it
sed -i 's|export PATH="/|export PATH="$PATH:/|' ~/.zshrc

############################
# RVM, Ruby, Ruby on Rails #
############################

gpg --keyserver hkp://keys.gnupg.net --recv-keys \
  409B6B1796C275462A1703113804BB82D39DC0E3
curl --silent --show-error --location https://get.rvm.io | bash -s stable
# For all in one installation append `--rails` or `--ruby` or `--ruby=1.9.3`.
# To run in command line, use `\curl` instead of `curl` to dealias.
# Options for curl can be abbreviated as `-sSL`.
