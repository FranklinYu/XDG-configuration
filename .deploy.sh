# Parameters (passed as environment variables):
#   NO_RIME: if non-empty, skip synchronization of Rime schemas

set -o errexit

return_error_with_message() {
	if [ -t 2 ]
	then >&2 printf '\e[31m%s\e[0m\n' "$*"
	else >&2 echo "$*"
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
ensure_link() {
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
			then printf '\e[30;1m%s verified\e[0m\n' "$2"
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

if [ -n "$NO_RIME" ]
then echo 'Rime skipped'
else ~/.config/ibus/rime/plum/rime-install jyutping
fi

if [ `uname -s` = Darwin ]
then ensure_link ~/.config/ibus/rime ~/Library/Rime
fi
