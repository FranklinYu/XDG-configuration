# set theme to eastwood (no UTF-8 requirement), or gallois, or kolo
# (from https://github.com/robbyrussell/oh-my-zsh/wiki/Themes#eastwood )
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="eastwood"/' ~/.zshrc

# my customization
sed -i 's|# ZSH_CUSTOM=/path/to/new-custom-folder|ZSH_CUSTOM=~/.oh-my-zsh-custom|' ~/.zshrc
sudo apt-get install git
git clone https://github.com/franklinyu/oh-my-zsh-custom.git ~/.oh-my-zsh-custom
cd ~/.oh-my-zsh-custom
git checkout my-custom
