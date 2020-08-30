alias g=git
alias be='bundle exec'
alias ls='ls --color=auto'
alias docker-shell='docker run --rm --interactive --tty --volume "$PWD:/docker"'
alias ping='ping -c 10'

if command -v exa >/dev/null 2>&1
then alias ll='exa --long' la='exa --all' tree='exa --tree'
else alias ll='ls -l --human-readable' la='ls --almost-all'
fi

if [ -f /usr/share/vim/vim81/macros/less.sh ]
then alias vless=/usr/share/vim/vim81/macros/less.sh
elif [ -f /usr/share/vim/vim80/macros/less.sh ]
then alias vless=/usr/share/vim/vim80/macros/less.sh
fi

source_maybe() {
	if [ -f "$1" ]
	then source "$1"
	else return 1
	fi
}

source_maybe ~/.config/posix-sh/local-config.sh

unset -f source_maybe
