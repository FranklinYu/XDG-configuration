set -o errexit

ensure_link() {
    if ! [ -e "$2" ]; then
        ln -f -s "$1" "$2"
    elif [ -h "$2" ]; then
        ls -dl "$2"
    else
        >&2 echo "Error: [$2] exists"
        return 1
    fi
}

ensure_link ~/.config/posix-sh/profile.sh ~/.profile
ensure_link ~/.config/readline/inputrc ~/.inputrc
ensure_link ~/.config/tmux/tmux.conf ~/.tmux.conf
ensure_link ~/.config/vim/config.vim ~/.vimrc
ensure_link ~/.config/zsh/newuser-install.zsh ~/.zshrc
ensure_link ~/.config/zsh/zprofile.zsh ~/.zprofile

mkdir -p ~/.cache
cd ~/.cache
mkdir -p irb nodejs vim zsh

mkdir -p ~/.local/share
cd ~/.local/share
mkdir -p gnupg rlwrap cargo vagrant
