set -o errexit

folder=$(cd `dirname "$0"` && pwd)
ln -f -s "$folder/vim/vimrc" ~/.vimrc
ln -f -s "$folder/zsh/newuser-install.zsh" ~/.zshrc
ln -f -s "$folder/zsh/zprofile.zsh" ~/.zprofile

mkdir -p ~/.cache/zsh
mkdir -p ~/.cache/irb
