alias g=git
alias be='bundle exec'
alias docker-shell='docker run --rm --interactive --tty --volume "$PWD:/docker"'
alias ping='ping -c 10'
alias pu=pushd po=popd d='dirs -v'
alias grep='grep --color'

# When the “LESS” environment variable is unset, Git sets it to FRX;
# https://git-scm.com/docs/git-config/2.31.1#Documentation/git-config.txt-corepager
# Therefore, an alias is used instead of setting the environment variable, to
# make use of this default setting.
alias less='less --LINE-NUMBERS --LONG-PROMPT'

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

if ! command -v octave >/dev/null && command -v docker >/dev/null
then alias octave='docker-shell franklinyu/octave'
fi

if [ "`uname`" = Darwin ]
then alias cp='cp -v' ln='ln -v' mv='mv -v' rm='rm -v' chown='chown -v' chmod='chmod -vv'
else alias cp='cp --verbose' ln='ln --verbose' mv='mv --verbose' rm='rm --verbose' chown='chown --verbose' chmod='chmod --verbose'
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
