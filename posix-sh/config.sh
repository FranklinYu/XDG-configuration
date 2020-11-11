alias g=git
alias be='bundle exec'
alias docker-shell='docker run --rm --interactive --tty --volume "$PWD:/docker"'
alias ping='ping -c 10'
alias pu=pushd po=popd d='dirs -v'

if command -v exa >/dev/null 2>&1
then alias ls=exa ll='exa --long' la='exa --all' tree='exa --tree'
else alias ls='ls --color=auto' ll='ls -l --human-readable' la='ls --almost-all'
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

# [deprecated]
source_maybe() {
	2>/dev/null . "$1"
}

source_maybe ~/.config/posix-sh/local-config.sh

unset -f source_maybe
