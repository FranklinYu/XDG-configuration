alias g=git
alias be='bundle exec'
alias docker-shell='docker run --rm --interactive --tty --volume "$PWD:/docker"'
alias ping='ping -c 10'
alias pu=pushd po=popd d='dirs -v'

if [ "`uname`" = Darwin ]
then ___ll_prefix='LC_TIME=en_US.UTF-8 '
else ___ll_prefix=''
fi
if command -v exa >/dev/null 2>&1
then alias ls=exa ll="${___ll_prefix}exa --long --header" la='exa --all' tree='exa --tree'
else alias ls='ls --color=auto' ll="${___ll_prefix}ls -l --human-readable" la='ls --almost-all'
fi
unset ___ll_prefix

if command -v lsb_release && [ "`lsb_release --id --short`" = Debian ]
then alias fd=fdfind bat=batcat
fi

if command -v bat >/dev/null
then alias cat='bat --style=plain'
else alias bat=cat
fi

if [ -f /usr/share/vim/vim81/macros/less.sh ]
then alias vless=/usr/share/vim/vim81/macros/less.sh
elif [ -f /usr/share/vim/vim80/macros/less.sh ]
then alias vless=/usr/share/vim/vim80/macros/less.sh
fi

if [ "`uname`" = Darwin ]
then alias cp='cp -v' mv='mv -v' rm='rm -v'
else alias cp='cp --verbose' mv='mv --verbose' rm='rm --verbose'
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
