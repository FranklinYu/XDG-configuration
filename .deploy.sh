set -o errexit

function return_error_with_message() {
	if [ -t 0 ]
	then >&2 echo "\033[31m$*\033[0m"
	else echo "$*"
	fi
	return 1
}

# readlink isn’t guaranteed by POSIX
if ! command -v readlink >/dev/null
then return_error_with_message "Error: readlink unavailable"
fi

# Ensure a link from $2 to $1 exist.
#
# Argument order is the same as ln(1).
function ensure_link() {
	if ! [ -e "$2" ] # no such file yet
	then
		ln -s "$1" "$2"
		echo "$2 created"
	elif [ -h "$2" ] # symbolic link exists
	then
		link_target=`readlink $2`
		if [ "$link_target" = "$1" ]
		then
			if [ -t 0 ]
			then echo "\033[30;1m$2 verified\033[0m"
			else echo "$2 verified"
			fi
		else return_error_with_message "Error: [$2] points to [$link_target]"
		fi
	else return_error_with_message "Error: trying to overwrite [$2]"
	fi
}

ensure_link ~/.config/bash/profile.bash ~/.bash_profile
ensure_link ~/.config/editline/editrc ~/.editrc
ensure_link ~/.config/posix-sh/profile.sh ~/.profile
ensure_link ~/.config/readline/inputrc ~/.inputrc
ensure_link ~/.config/rspec ~/.rspec
ensure_link ~/.config/tmux/tmux.conf ~/.tmux.conf
ensure_link ~/.config/vim/config.vim ~/.vimrc
ensure_link ~/.config/xorg/xsessionrc ~/.sessionrc
ensure_link ~/.config/zsh/newuser-install.zsh ~/.zshrc
ensure_link ~/.config/zsh/zprofile.zsh ~/.zprofile

mkdir -p ~/.cache
cd ~/.cache
mkdir -p irb nodejs vim zsh

mkdir -p ~/.local/share
cd ~/.local/share
mkdir -p gnupg rlwrap cargo vagrant

~/.config/ibus/rime/plum/rime-install jyutping

if [ `uname -s` = Darwin ]
then ensure_link ~/.config/ibus/rime ~/Library/Rime
fi
