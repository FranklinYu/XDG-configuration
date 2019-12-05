alias g=git
alias be='bundle exec'
alias ls='ls --color=auto' ll='ls -l --human-readable' la='ls --almost-all'
alias docker-shell='docker run --rm --interactive --tty --volume "$PWD:/docker"'

if [ -f /usr/share/vim/vim81/macros/less.sh ]
then alias less=/usr/share/vim/vim81/macros/less.sh
elif [ -f /usr/share/vim/vim80/macros/less.sh ]
then alias less=/usr/share/vim/vim80/macros/less.sh
fi

if [ -f ~/.config/posix-sh/local-config.sh ]
then source ~/.config/posix-sh/local-config.sh
fi
