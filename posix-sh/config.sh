alias g=git
alias be='bundle exec'
alias docker-shell='docker run --rm --interactive --tty --volume "$PWD:/docker"'
alias ping='ping -c 10'
alias pu=pushd po=popd d='dirs -v'
alias grep='grep --color'

if command -v lsb_release >/dev/null && [ "`lsb_release --id --short`" = Debian ]
then alias fd=fdfind bat=batcat
fi

if command -v bat >/dev/null
then alias cat='bat --style=plain'
fi

if [ -f /usr/share/vim/vim82/macros/less.sh ]
then alias vless=/usr/share/vim/vim82/macros/less.sh
elif [ -f /usr/share/vim/vim81/macros/less.sh ]
then alias vless=/usr/share/vim/vim81/macros/less.sh
elif [ -f /usr/share/vim/vim80/macros/less.sh ]
then alias vless=/usr/share/vim/vim80/macros/less.sh
fi

if [ "`uname`" = Darwin ]
then alias cp='cp -v' ln='ln -v' mv='mv -v' rm='rm -v'
else alias cp='cp --verbose' ln='ln --verbose' mv='mv --verbose' rm='rm --verbose'
fi

# https://unix.stackexchange.com/questions/623725/does-posix-specify-whether-to-continue-script-when-nested-dot-fails
source_maybe() {
	if [ -f "$1" ]
	then . "$1"
	else return 1
	fi
}

source_maybe ~/.config/posix-sh/local-config.sh

unset -f source_maybe
